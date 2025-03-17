#!/usr/bin/perl -w
#
# Author: Jurriaan Hage
# Run from the $WEB/reviews directory.
$toDelete = "[2]";
$basedir = "";
$destdir = "";
$exrems = "exrems";
print "Run this program from the $ENV{'WEB'}/reviews directory.";
print "As a side effect a file $exrems is generated.";
if ($#ARGV != 0) {
  die "Too few or many parameters. I need only the name of the review file\n";
}
$infile = $ARGV[0];
$basename = $infile;
$basename =~ s/\..*//;
$outfile = $destdir . $basename . ".html";
system ("mv $infile $basename.extra");

open (EX, ">>$exrems") || die "Could not create $exrems: $!";
print EX "# To be run from the reviews directory\n";
chmod 0700, $exrems;
open (OUT, ">$outfile") || die "Could not create $outfile: $!";
select (OUT);
$infile = $basename . ".extra";
open (IN, $infile) || die "Could not open $infile: $!";
print STDOUT "Removing samples from $outfile\n";

while ($line = <IN>) {
	print $line;
  if ($line =~ /\<H2\>Tracks/) {
		last;
	}
}

while ($line = <IN>) {
  if ($line =~ /\<A HREF\=\"samples\//) {
    # Skip now
	}
	else {
	  print $line;
	}
}

# Move unwanted files
# moveThem();
 
close (IN) || die "Could not close $infile: $!";
close (OUT) || die "Could not close $outfile: $!";
close (EX) || die "Could not close $exrems: $!";

sub moveThem {
  print EX "rm $destdir" . "samples/$basename$toDelete.mp3\n";
  print EX "rm $destdir" . "samples/$basename$toDelete.ra\n";
#  for ($i=1; $i<=8 ; $i++) {
#		if (($i!=$noDel1) && ($i!=$noDel2)) {
#		  print EX "rm $destdir" . "samples/$basename" . $i . ".mp3\n";
#   	  system ("rm $destdir" . "samples/$basename" . $i . ".mp3");
#  	  print EX "rm $destdir" . "samples/$basename" . $i . ".ra\n";
#			system ("rm $destdir" . "samples/$basename" . $i . ".ra");
#		}	
#	}
}

