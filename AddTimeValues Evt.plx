#!/usr/bin/perl
use strict;
use warnings;

my $read = "full-game";
my $write = "full-game-time.evt";

my $count = 0;

open(my $fh_in, '<:encoding(UTF-8)', $read)
  or die "Could not open file '$read' $!";
  
open(my $fh_out, '>:encoding(UTF-8)', $write)
  or die "Could not open file '$write' $!";
  
print $fh_out "&FLUSHING(8)\n";
while (my $row = <$fh_in>) {
  chomp $row;
  print $fh_out "&TIME(10753.295594424116)\n";
  print $fh_out "com.softwareag.saep.RawEvent(". $row . ");\n";
  $count++;
  if ($count % 100000 == 0) {
	print "Line $count reached.\n";
  }
	
}

close $fh_in;
close $fh_out;

print "done\n";
1;