#!/bin/sh
# \
exec expect -- "$0" ${1+"$@"}
# mkpasswd - make a password, if username given, set it.
# Author: Don Libes, NIST
# Edited by Amro Diab to remove difficult characters; July 2011

# defaults
set length 9
set minnum 2
set minlower 2
set minupper 2
set minspecial 1
set verbose 0
set distribute 0

if {[file executable /bin/nispasswd]} {
  set defaultprog /bin/nispasswd
} elseif {[file executable /bin/yppasswd]} {
  set defaultprog /bin/yppasswd
} elseif {[file executable /bin/passwd]} {
  set defaultprog /bin/passwd
} else {
  set defaultprog passwd
}
set prog $defaultprog

while {[llength $argv]>0} {
  set flag [lindex $argv 0]
  switch -- $flag \
  "-l" {
    set length [lindex $argv 1]
    set argv [lrange $argv 2 end]
  } "-d" {
    set minnum [lindex $argv 1]
    set argv [lrange $argv 2 end]
  } "-c" {
    set minlower [lindex $argv 1]
    set argv [lrange $argv 2 end]
  } "-C" {
    set minupper [lindex $argv 1]
    set argv [lrange $argv 2 end]
  } "-s" {
    set minspecial [lindex $argv 1]
    set argv [lrange $argv 2 end]
  } "-v" {
    set verbose 1
    set argv [lrange $argv 1 end]
  } "-p" {
    set prog [lindex $argv 1]
    set argv [lrange $argv 2 end]
  } "-2" {
    set distribute 1
    set argv [lrange $argv 1 end]
  } default {
    set user [lindex $argv 0]
    set argv [lrange $argv 1 end]
    break
  }
}

if {[llength $argv]} {
  puts "usage: mkpasswd \[args] \[user]"
  puts "  where arguments are:"
  puts "    -l #      (length of password, default = $length)"
  puts "    -d #      (min # of digits, default = $minnum)"
  puts "    -c #      (min # of lowercase chars, default = $minlower)"
  puts "    -C #      (min # of uppercase chars, default = $minupper)"
  puts "    -s #      (min # of special chars, default = $minspecial)"
  puts "    -v        (verbose, show passwd interaction)"
  puts "    -p prog   (program to set password, default = $defaultprog)"
  exit 1
}

if {$minnum + $minlower + $minupper + $minspecial > $length} {
  puts "impossible to generate $length-character password\
    with $minnum numbers, $minlower lowercase letters,\
    $minupper uppercase letters and\
    $minspecial special characters."
  exit 1
}

# if there is any underspecification, use additional lowercase letters
set minlower [expr {$length - ($minnum + $minupper + $minspecial)}]

set lpass ""    ;# password chars typed by left hand
set rpass ""    ;# password chars typed by right hand

# insert char into password at a random position, thereby spreading
# the different kinds of characters throughout the password
proc insert {pvar char} {
    upvar $pvar p

    set p [linsert $p [rand [expr {(1+[llength $p])}]] $char]
}

proc rand {m} {
    set device /dev/urandom    ;# /dev/random can block
    set fileId [open $device r]
    binary scan [read $fileId 4] i1 number
    set clipped [expr $number % $m]
#    puts "number is $number"
#    puts "clipped is $clipped"
    close $fileId
    return $clipped
}

# choose left or right starting hand
set initially_left [set isleft [rand 2]]

# given a size, distribute between left and right hands
# taking into account where we left off
proc psplit {max lvar rvar} {
  upvar $lvar left $rvar right
  global isleft

  if {$isleft} {
    set right [expr $max/2]
    set left [expr $max-$right]
    set isleft [expr !($max%2)]
  } else {
    set left [expr $max/2]
    set right [expr $max-$left]
    set isleft [expr $max%2]
  }
}

if {$distribute} {
  set lkeys {q w e r t a s d f g z x c v b}
  set rkeys {y u i o p h j k l n m}
  set lnums {1 2 3 4 5 6}
  set rnums {7 8 9 0}
  #set lspec {! @ # \$ %}
  set lspec {}
  #set rspec {^ & * ( ) - = _ + [ ] "{" "}" \\ | ; : ' \" < > , . ? /}
  set rspec {}
} else {
  set lkeys {a b c d e f g h i j k l m n o p q r s t u v w x y z}
  set rkeys {a b c d e f g h i j k l m n o p q r s t u v w x y z}
  set lnums {0 1 2 3 4 5 6 7 8 9}
  set rnums {0 1 2 3 4 5 6 7 8 9}
  set lspec {a b c}
  #set lspec {! @ # \$ % ~ ^ & * ( ) - = _ + [ ] "{" "}" \\ | ; : ' \" < > , . ? /}
  #set rspec {! @ # \$ % ~ ^ & * ( ) - = _ + [ ] "{" "}" \\ | ; : ' \" < > , . ? /}
  set rspec {d e f}
}

set lkeys_length [llength $lkeys]
set rkeys_length [llength $rkeys]
set lnums_length [llength $lnums]
set rnums_length [llength $rnums]
set lspec_length [llength $lspec]
set rspec_length [llength $rspec]

psplit $minnum left right
for {set i 0} {$i<$left} {incr i} {
  insert lpass [lindex $lnums [rand $lnums_length]]
}
for {set i 0} {$i<$right} {incr i} {
  insert rpass [lindex $rnums [rand $rnums_length]]
}

psplit $minlower left right
for {set i 0} {$i<$left} {incr i} {
  insert lpass [lindex $lkeys [rand $lkeys_length]]
}
for {set i 0} {$i<$right} {incr i} {
  insert rpass [lindex $rkeys [rand $rkeys_length]]
}

psplit $minupper left right
for {set i 0} {$i<$left} {incr i} {
  insert lpass [string toupper [lindex $lkeys [rand $lkeys_length]]]
}
for {set i 0} {$i<$right} {incr i} {
  insert rpass [string toupper [lindex $rkeys [rand $rkeys_length]]]
}

psplit $minspecial left right
for {set i 0} {$i<$left} {incr i} {
  insert lpass [lindex $lspec [rand $lspec_length]]
}
for {set i 0} {$i<$right} {incr i} {
  insert rpass [lindex $rspec [rand $rspec_length]]
}

# merge results together
foreach l $lpass r $rpass {
    if {$initially_left} {
  append password $l $r
    } else {
  append password $r $l
    }
}

if {[info exists user]} {
  if {!$verbose} {
    log_user 0
  }

  spawn $prog $user
  expect {
    "assword*:" {
      # some systems say "Password (again):"
      send "$password\r"
      exp_continue
    }
  }

  # if user isn't watching, check status
  if {!$verbose} {
    if {[lindex [wait] 3]} {
      puts -nonewline "$expect_out(buffer)"
      exit 1
    }
  }

        if {$verbose} {
      puts -nonewline "password for $user is "
        }
}

puts "$password"
