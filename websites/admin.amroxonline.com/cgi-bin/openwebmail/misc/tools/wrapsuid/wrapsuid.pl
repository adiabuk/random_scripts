#!/usr/bin/perl
'di';
'ig00';

# Revision 1.1  90/08/11  13:51:29  lwall
# Initial revision

$xdev = '-xdev' unless -d '/dev/iop';

if ($#ARGV >= 0) {
    	@list = @ARGV;
    	foreach $name (@ARGV) {
		die "You must use absolute pathnames.\n" unless $name =~ m|^/|;
    	}
	}

$fslist = join(' ',@list);
die "Can't find local filesystems" unless $fslist;
open(FIND,  "find $fslist $xdev -type f \\( -perm -04000 -o -perm -02000 \\) -print|");

while (<FIND>) {
    chop;
    next unless -T;
    print "Fixing ", $_, "\n";
    ($dir,$file) = m|(.*)/(.*)|;
    chdir $dir || die "Can't chdir to $dir";
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks)
     = stat($file);
    die "Can't stat $_" unless $ino;
    chmod $mode & 01777, $file;# wipe out set[ug]id bits
    rename($file,".$file");
    open(C,">.tmp$$.c") || die "Can't write C program for $_";
    $real = "$dir/.$file";
    print C '
	main(argc,argv)
	int argc;
	char **argv;
	{
		execv("' . $real . '",argv);
	}
	';
    close C;
    if ( -x '/usr/bin/cc') {
       system '/usr/bin/cc', ".tmp$$.c", '-o', $file;
    } elsif (-x '/usr/bin/gcc' ) {
       system '/usr/bin/gcc', ".tmp$$.c", '-o', $file;
    } elsif (-x '/usr/local/bin/gcc' ) {
       system '/usr/local/bin/gcc', ".tmp$$.c", '-o', $file;
    } else {
       die "Can't find C compiler";
    }
    die "Can't compile new $_" if $?;
    chmod $mode, $file;
    chown $uid, $gid, $file;
    unlink ".tmp$$.c";
    chdir '/';
}
##############################################################################

	# These next few lines are legal in both Perl and nroff.

.00;			# finish .ig
 
'di			\" finish diversion--previous line must be blank
.nr nl 0-1		\" fake up transition to first page again
.nr % 0			\" start at page 1
'; __END__ ############# From here on it's a standard manual page ############
.TH SUIDSCRIPT 1 "July 30, 1990"
.AT 3
.SH NAME
wrapsuid \- puts a compiled C wrapper around a setuid or setgid script
.SH SYNOPSIS
.B wrapsuid [dirlist]
.SH DESCRIPTION
.I Wrapsuid
creates a small C program to execute a script with setuid or setgid privileges
without having to set the setuid or setgid bit on the script, which is
a security problem on many machines.
Specify the list of directories or files that you wish to process.
The names must be absolute pathnames.
With no arguments it will attempt to process all the local directories
for this machine.
The scripts to be processed must have the setuid or setgid bit set.
The wrapsuid program will delete the bits and set them on the wrapper.
.PP
Non-superusers may only process their own files.
.SH ENVIRONMENT
No environment variables are used.
.SH FILES
None.
.SH AUTHOR
Larry Wall
.SH "SEE ALSO"
.SH DIAGNOSTICS
.SH BUGS
.ex
