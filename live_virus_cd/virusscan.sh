#!/bin/sh

# SysV initscript for Amrox Virus scanner, using ClamAV.  Displays a TUI with
# various options to navigate around the various options.  User will be locked
# into the menu, unable to escape to the shell, as this distro's purpose is
# virus scanning of existing disks only.  Exiting will force a reboot
# Tested with KNOPPIX v
#
# Author: Amro Diab
# Date: 20/06/2007

case "$1" in

start)
  if [ "$HEED_DEFAULT_DISPLAY_MANAGER" = "true" ] &&
    [ -e $DEFAULT_DISPLAY_MANAGER_FILE ] &&
    [ "$(cat $DEFAULT_DISPLAY_MANAGER_FILE)" != "$DAEMON" ]; then
    echo "Not starting X display manager (xdm); it is not the default" \
      "display manager."
  else
    echo -n "Starting Amrox Virus Scanner"
    start-stop-daemon --start --quiet $SSD_START_ARGS \
      || echo -n " already running"
    echo "."
  fi
  ;;

restart)
  /etc/init.d/virusscan.sh stop;
  [ -f $PIDFILE ] && exit 1
  /etc/init.d/virusscan.sh start
  ;;
reload)
  echo -n "Reloading Amrox Virus Scanner configuration..."
  if start-stop-daemon --stop --quiet $SSD_RELOAD_ARGS; then
    echo "done."
  else
    echo "Amrox Virus Scanner not running."
  fi
  ;;

force-reload)
  /etc/init.d/virusscan reload
  ;;

stop)
  echo -n "Stopping Amrox Virus Scanner: virusscan.sh"
  if ! [ -f $PIDFILE ]; then
    echo -n " not running ($PIDFILE not found)"
  else
    start-stop-daemon --stop --quiet $SSD_STOP_ARGS
    SSD_RES=$?
    if [ $SSD_RES -eq 1 ]; then
      echo -n " not running"
    fi
    if [ $SSD_RES -eq 2 ]; then
      echo -n " not responding to TERM signals"
    else
      if [ -f $PIDFILE ]; then
        echo -n " (removing stale $PIDFILE)"
        rm $PIDFILE
      fi
    fi
  fi
  echo "."
  ;;

*)
  echo "Usage: /etc/init.d/virusscan.sh {start|stop|restart|reload|force-reload}"
  exit 1
  ;;

esac

export COLUMNS=$2
let "space = ($COLUMNS -65 )/2"
export strspace=" "
i=0
while [ $i -lt $space ] do
  strspace=" "$strspace
  i=$[$i+1]
done

echo "a $strspace z"

let "space2 = ($COLUMNS -19 )/2"
i=0
while [ $i -lt $space2 ] do
  strspace2=" "$strspace2
  i=$[$i+1]
done

i=0
let "space3 = ($COLUMNS -0 )/1"
while [ $i -lt $space3 ] do
  strspace3=" "$strspace3
  i=$[$i+1]
done


scan()
{
  LOL=$3
  if [ -z "$4" ] then
    echo "LOOOOOOOOOOL" > /tmp/lol
    # no parameters passed

  else
    echo $1 $2 $3 > /tmp/lol # first parameter, second parameter, third etc...
    echo "not zero length" >> /tmp/lol
    # warning
    dialog --title "Warning" --yesno \
      "You have selected to remove all viruses - Are you sure you wish to do this?" 10 20
  fi

  touch /tmp/output.log
  echo "worked" >> /tmp/lol
  echo "done...";
  echo "Performing $3 ..."
  #mount /media/* > /dev/null 2>&1
  mount -a
  touch /tmp/output.log
  clamscan $1 $2 --log=/tmp/output.log --recursive --unzip --unrar --arj \
    --unzoo --lha --jar --tar --deb --tgz &>/tmp/output.log| bar_cat
  echo "done again"


}


#banner "Welcome to Amrox Virus Remover"
trap '' INT
trap '' HUP
trap '' QUIT
trap '' TERM
trap '' 20 24
IGNOREEOF=500

dirscan()
{

      ls /mnt &> /tmp/lsout
      cat /tmp/lsout
      echo "Choose parition you with to scan:> "
      read menu2
      MENU2='scanning and removing from $menu2'

      scan /mnt/$menu2 '' $2  '$MENU2' $1


}


main()
{
  while true
  do
    clear
    if [ -n "$LOL" ] then
      echo $LOL "complete"
    fi
    export SP="                              "
    echo -e "\033[1;41m\033[41m $strspace2 M a i n   M e n u $strspace2\033[0m\n"

    echo "$strspace*****************************************************************"
    echo "$strspace*****************************************************************"
    echo "$strspace**    1.   Full Virus Scan / Scan & Remove                     **"
    echo "$strspace**    2.   Full Virus Scan / Scan Only                         **"
    echo "$strspace**    3.   Select from available drives / Scan & Remove        **"
    echo "$strspace**    4.   Select from available drives / Scan Only            **"
    echo "$strspace**    5.   View Report from last scan                          **"
    echo "$strspace**    6.   Exit and Reboot                                     **"
    echo "$strspace*****************************************************************"
    echo "$strspace*****************************************************************"
    echo " "
    echo -e "\033[1;41m\033[41m$strspace3\033[0m\n"
    echo "Enter choice: -"
    read menu1

    if test $menu1 -eq 1 then

      scan /mnt --remove 'full scan and removal' '4'

    fi

    if test $menu1 -eq 2 then
      scan /mnt '' 'full scan only'
    fi

    if test $menu1 -eq 3 then
      #ls /mnt &> /tmp/lsout
      #cat /tmp/lsout
      #echo "Choose parition you with to scan:> "
      #read menu2
      #MENU2='scanning and removing from $menu2'
     dirscan --remove
      #scan /mnt/$menu2 --remove '$MENU2' '4'

    fi

    if test $menu1 -eq 4 then
      dirscan
      #scan /mnt/$menu2 '' 'scanning and removing from $MENU2' ''
    fi


    if test $menu1 -eq 5 then

      if [ -e "/tmp/output.log" ]; then
        echo "Results of last scan..."
        #grep -v LibClamAV /tmp/output.log | less
  echo "Viruses found"
  awk '/FOUND/ {print $1}' /tmp/output.log |less
  awk '/FOUND/ {print $1} ' /tmp/output.log | wc | awk '// {print $1} '&& echo "viruses found" | less

      else
        dialog --title "File not found" --msgbox "No results to output, please perform a scan first" 10 20 2>/tmp/dialog.ans
      fi

    echo "lol"
  fi

  if test $menu1 -eq 6 then
    exit
    init 6
  fi

  done
}






BAR_VERSION=1.4
bar_cat()
{
  test -z "${BAR_WIDTH}" && test -n "${COLUMNS}" && BAR_WIDTH=${COLUMNS}
  ( expr "${BAR_WIDTH}" + 0 >/dev/null 2>&1 ) || BAR_WIDTH=0
  BAR_WIDTH=`expr ${BAR_WIDTH} + 0` || BAR_WIDTH=0
  test "x${BAR_WIDTH}" = x0 && BAR_WIDTH=76
  test -n "${BAR_BS}" || BAR_BS=1048567
  test -n "${BAR_PERC}" || BAR_PERC=1
  test -n "${BAR_ETA}" || BAR_ETA=1
  test -n "${BAR_TRACE_WIDTH}" || BAR_TRACE_WIDTH=10
  test -n "${BAR_CMD}" || BAR_CMD=cat
  test -n "${BAR_L}"  || BAR_L='['
  test -n "${BAR_R}"  || BAR_R=']'
  test -n "${BAR_C0}" || BAR_C0='.'
  test -n "${BAR_C1}" || BAR_C1='='
  test -n "${BAR_OK}" || BAR_OK=1

  BAR_WIDTH=`expr ${BAR_WIDTH} - 3`
  bar_trace=''
  if test "x${BAR_TRACE}" = x1 then
    BAR_WIDTH=`expr ${BAR_WIDTH} - ${BAR_TRACE_WIDTH}`
    bar_lauf=${BAR_TRACE_WIDTH}
    bar_t_space=''
    bar_t_dot=''
    while test "${bar_lauf}" -gt 1 do
      bar_t_space="${bar_t_space} "
      bar_t_dot="${bar_t_dot}."
      bar_lauf=`expr ${bar_lauf} - 1`
    done
    bar_trace="${bar_t_space} "
  fi

  bar_eta=''
  BAR_GET_TIME='echo'
  ( expr 1 + ${SECONDS} >/dev/null 2>&1 ) || BAR_ETA=0
  if test "x${BAR_ETA}" = x1 then
    BAR_GET_TIME='( echo ${SECONDS} )'
    BAR_WIDTH=`expr ${BAR_WIDTH} - 6`
    bar_eta='--:-- '
  fi
  bar_perc=''
  if test "x${BAR_PERC}" = x1 then
    BAR_WIDTH=`expr ${BAR_WIDTH} - 5`
    bar_perc='  0% '
  fi

  BAR_GET_SIZE='( ls -l "${BAR_DIR}${bar_file}${BAR_EXT}" | sed "s@  *@ @g" | cut -d " " -f 5 ) 2>/dev/null'
  ( ( echo a                   ) >/dev/null 2>&1 ) || BAR_OK=0
  ( ( echo a | dd bs=2 count=2 ) >/dev/null 2>&1 ) || BAR_OK=0
  ( ( echo a | grep a          ) >/dev/null 2>&1 ) || BAR_OK=0
  ( ( echo a | sed 's@  *@ @g' ) >/dev/null 2>&1 ) || BAR_OK=0
  ( ( echo a | cut -d ' ' -f 1 ) >/dev/null 2>&1 ) || BAR_OK=0
  test "${BAR_WIDTH}" -ge 4 || BAR_OK=0
  BAR_ECHO='echo'
  BAR_E_C1=''
  BAR_E_C2=''
  BAR_E_NL='echo'
  if echo -n abc >/dev/null 2>&1 then
    BAR_E_C1='-n'
  fi
  if ( ( ${BAR_ECHO} "${BAR_E_C1}" abc ; echo 1,2,3 ) | grep n ) >/dev/null 2>&1 then
    if ( ( ${BAR_ECHO} 'xyz\c' ; echo 1,2,3 ) | grep c ) >/dev/null 2>&1 then
      if ( ( printf 'ab%s' c ; echo 1,2,3 ) | grep abc ) >/dev/null 2>&1 then
        BAR_ECHO='printf'
        BAR_E_C1='%s'
      else
        BAR_ECHO=':'
        BAR_E_C1=''
        BAR_E_NL=':'
        BAR_OK=0
      fi
    else
      BAR_E_C1=''
      BAR_E_C2='\c'
    fi
  fi

  bar_shown=0
  if test "${BAR_OK}" = 1 then
    bar_lauf=0
    bar_graph=''
    while test `expr ${bar_lauf} + 5` -le "${BAR_WIDTH}" do
      bar_graph="${bar_graph}${BAR_C0}${BAR_C0}${BAR_C0}${BAR_C0}${BAR_C0}"
      bar_lauf=`expr ${bar_lauf} + 5`
    done

    while test "${bar_lauf}" -lt "${BAR_WIDTH}" do
      bar_graph="${bar_graph}${BAR_C0}"
      bar_lauf=`expr ${bar_lauf} + 1`
    done

    ${BAR_ECHO} "${BAR_E_C1}" "${bar_trace}${bar_eta}${bar_perc}${BAR_L}${bar_graph}${BAR_R}${BAR_E_C2}" 1>&2
    bar_shown=1
  fi

  ( ( test 1999999998 = `expr 999999999 + 999999999` ) >/dev/null 2>&1 ) || BAR_OK=0
  bar_large_num="........."
  bar_div=""
  bar_numsuff=""
  bar_size=0
  if test -n "${BAR_SIZE}" then
    bar_size=${BAR_SIZE}
    while expr "${bar_size}" : "${bar_large_num}" >/dev/null 2>&1 do
      bar_div="${bar_div}."
      bar_numsuff="${bar_numsuff}0"
      bar_size=`expr "${bar_size}" : '\(.*\).$'`
    done
    BAR_GET_SIZE="echo '${BAR_SIZE}'"
  else
    for bar_file do
      bar_size1=0
      if test -f "${BAR_DIR}${bar_file}${BAR_EXT}" then
        bar_size1=`eval "${BAR_GET_SIZE}"`
        if test -n "${bar_div}" then
          bar_size1=`expr "${bar_size1}" : '\(.*\)'${bar_div}'$'` || bar_size1=0
        fi
        while expr "${bar_size1}" : "${bar_large_num}" >/dev/null 2>&1 do
          bar_div="${bar_div}."
          bar_numsuff="${bar_numsuff}0"
          bar_size1=`expr "${bar_size1}" : '\(.*\).$'`
          bar_size=`expr "${bar_size}" : '\(.*\).$'` || bar_size=0
        done
        if test -n "${bar_div}" then
          bar_size1=`expr "${bar_size1}" + 1`
        fi
        bar_size=`expr ${bar_size} + ${bar_size1}`
        while expr "${bar_size}" : "${bar_large_num}" >/dev/null 2>&1 do
          bar_div="${bar_div}."
          bar_numsuff="${bar_numsuff}0"
          bar_size=`expr "${bar_size}" : '\(.*\).$'`
        done
      else
        BAR_OK=0
      fi
    done
  fi
  bar_quad=`expr ${BAR_WIDTH} '*' ${BAR_WIDTH}`
  test "${bar_size}" -gt "${bar_quad}" || BAR_OK=0
  if test "${BAR_OK}" = 0 then
    for bar_file do
      if test "${bar_file}" = "/dev/stdin" then
        eval "${BAR_CMD}"
      else
        eval "${BAR_CMD}" < "${BAR_DIR}${bar_file}${BAR_EXT}"
      fi
    done
  else
    bar_want_bps=`expr ${bar_size} + ${BAR_WIDTH}`
    bar_want_bps=`expr ${bar_want_bps} - 1`
    bar_want_bps=`expr ${bar_want_bps} / ${BAR_WIDTH}`
    bar_count=1
    if test "${bar_want_bps}" -gt "${BAR_BS}" then
      bar_count=`expr ${bar_want_bps} + ${BAR_BS}`
      bar_count=`expr ${bar_count} - 1`
      bar_count=`expr ${bar_count} / ${BAR_BS}`
    fi
    bar_wc=`expr ${BAR_WIDTH} '*' ${bar_count}`
    bar_bs=`expr ${bar_size} + ${bar_wc}`
    bar_bs=`expr ${bar_bs} - 1`
    bar_bs=`expr ${bar_bs} / ${bar_wc}`
    bar_bps=`expr ${bar_bs} '*' ${bar_count}`
    bar_bph=`expr ${bar_size} + 99`
    bar_bph=`expr ${bar_bph} / 100`
    bar_pos=0
    bar_graph="${BAR_L}"
    bar_cur_char=0
    bar_t0=`eval "${BAR_GET_TIME}" 2>/dev/null` || bar_t0=0

    for bar_file do
      if test "x${BAR_TRACE}" = x1 then
        bar_trace=`expr "${bar_file}" : '.*/\([^/][^/]*\)$'` || bar_trace="${bar_file}"
        bar_trace=`expr "${bar_trace}${bar_t_space}" : '\('${bar_t_dot}'\)'`
        bar_trace="${bar_trace} "
      fi

      bar_char=`expr ${bar_pos} / ${bar_want_bps}` || bar_char=0
      while test "${bar_char}" -gt `expr ${bar_cur_char} + 4` do
        bar_graph="${bar_graph}${BAR_C1}${BAR_C1}${BAR_C1}${BAR_C1}${BAR_C1}"
        bar_cur_char=`expr ${bar_cur_char} + 5`
      done

      while test "${bar_char}" -gt "${bar_cur_char}" do
        bar_graph="${bar_graph}${BAR_C1}"
        bar_cur_char=`expr ${bar_cur_char} + 1`
      done
      bar_size1=`eval "${BAR_GET_SIZE}" 2>/dev/null` || bar_size1=0

      if test -n "${bar_div}" then
        bar_size1=`expr "${bar_size1}" : '\(.*\)'${bar_div}'$'` || bar_size1=0
        bar_size1=`expr "${bar_size1}" + 1`
      fi

      bar_total=0
      (
      exec 6>&1
      exec 5<"${BAR_DIR}${bar_file}${BAR_EXT}"
      while test "${bar_total}" -lt "${bar_size1}" do
        dd bs="${bar_bs}" count="${bar_count}${bar_numsuff}" <&5 >&6 2>/dev/null
        bar_total=`expr ${bar_total} + ${bar_bps}`
        if test "${bar_total}" -gt "${bar_size1}" then
          bar_total="${bar_size1}"
        fi
        bar_pos1=`expr ${bar_pos} + ${bar_total}`
        bar_proz=`expr ${bar_pos1} / ${bar_bph}` || bar_proz=0
        if test "x${BAR_PERC}" = x1 then
          bar_perc="  ${bar_proz}% "
          bar_perc=`expr "${bar_perc}" : '.*\(.....\)$'`
        fi
        if test "x${BAR_ETA}" = x1 then
          bar_diff=`eval "${BAR_GET_TIME}" 2>/dev/null` || bar_diff=0
          bar_diff=`expr ${bar_diff} - ${bar_t0} 2>/dev/null` || bar_diff=0
          bar_100p=`expr 100 - ${bar_proz}` || bar_100p=0
          bar_diff=`expr ${bar_diff} '*' ${bar_100p}` || bar_diff=0
          bar_diff=`expr ${bar_diff} + ${bar_proz}` || bar_diff=0
          bar_diff=`expr ${bar_diff} - 1` || bar_diff=0
          bar_diff=`expr ${bar_diff} / ${bar_proz} 2>/dev/null` || bar_diff=0
          if test "${bar_diff}" -gt 0 then
            bar_t_unit=":"
            if test "${bar_diff}" -gt 2700 then
              bar_t_uni="h"
              bar_diff=`expr ${bar_diff} / 60`
            fi
            bar_diff_h=`expr ${bar_diff} / 60` || bar_diff_h=0
            if test "${bar_diff_h}" -gt 99 then
              bar_eta="     ${bar_diff_h}${bar_t_unit} "
            else
              bar_diff_hi=`expr ${bar_diff_h} '*' 60` || bar_diff_hi=0
              bar_diff=`expr ${bar_diff} - ${bar_diff_hi}` || bar_diff=0
              bar_diff=`expr "00${bar_diff}" : '.*\(..\)$'`
              bar_eta="     ${bar_diff_h}${bar_t_unit}${bar_diff} "
            fi
            bar_eta=`expr "${bar_eta}" : '.*\(......\)$'`
          fi
        fi
        bar_char=`expr ${bar_pos1} / ${bar_want_bps}` || bar_char=0
        while test "${bar_char}" -gt "${bar_cur_char}" do
          bar_graph="${bar_graph}${BAR_C1}"
          ${BAR_ECHO} "${BAR_E_C1}" "${bar_trace}${bar_eta}${bar_perc}${bar_graph}${BAR_E_C2}" 1>&2
          bar_cur_char=`expr ${bar_cur_char} + 1`
        done
      done
      ) | eval "${BAR_CMD}"
      bar_pos=`expr ${bar_pos} + ${bar_size1}`
    done
  fi
  if test "${bar_shown}" = 1 then
    test "x${BAR_TRACE}" = x1 && bar_trace="${bar_t_space} "
    test "x${BAR_ETA}" = x1   && bar_eta='      '
    if test "x${BAR_CLEAR}" = x1 then
      test "x${BAR_PERC}" = x1 && bar_perc='     '
      bar_lauf=0
      bar_graph=''
      while test `expr ${bar_lauf} + 5` -le "${BAR_WIDTH}" do
        bar_graph="${bar_graph}     "
        bar_lauf=`expr ${bar_lauf} + 5`
      done
      while test "${bar_lauf}" -lt "${BAR_WIDTH}" do
        bar_graph="${bar_graph} "
        bar_lauf=`expr ${bar_lauf} + 1`
      done
      ${BAR_ECHO} "${BAR_E_C1}" "${bar_trace}${bar_eta}${bar_perc} ${bar_graph} ${BAR_E_C2}" 1>&2
      else
        test "x${BAR_PERC}" = x1 && bar_perc='100% '
        bar_lauf=0
        bar_graph=''
      while test `expr ${bar_lauf} + 5` -le "${BAR_WIDTH}" do
        bar_graph="${bar_graph}${BAR_C1}${BAR_C1}${BAR_C1}${BAR_C1}${BAR_C1}"
        bar_lauf=`expr ${bar_lauf} + 5`
      done
      while test "${bar_lauf}" -lt "${BAR_WIDTH}" do
        bar_graph="${bar_graph}${BAR_C1}"
        bar_lauf=`expr ${bar_lauf} + 1`
      done
      ${BAR_ECHO} "${BAR_E_C1}" "${bar_trace}${bar_eta}${bar_perc}${BAR_L}${bar_graph}${BAR_R}${BAR_E_C2}" 1>&2
      ${BAR_E_NL} 1>&2
    fi
  fi
}

main
