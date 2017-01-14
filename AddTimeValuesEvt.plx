#!/usr/bin/perl
use strict;
use warnings;

my $read = "full-game"; # input path
my $write = "full-game-time.evt"; # output path

my $count = 0;

open(my $fh_in, '<:encoding(UTF-8)', $read)
  or die "Could not open file '$read' $!";
  
open(my $fh_out, '>:encoding(UTF-8)', $write)
  or die "Could not open file '$write' $!";
  
print $fh_out "&FLUSHING(10000)\n";
while (my $row = <$fh_in>) {
  chomp $row;
  $row =~ s/^\s+|\s+$//g;
  if ($count % 10 == 0) { # Each 200. element
  print $fh_out "&TIME(10634.93102028764025105)\n"; # time between events.
  print $fh_out "saep.Soccer.RawEvent(". $row . ");\n";
  }
  $count++;
  if ($count % 100000 == 0) {
	print "Line $count reached.\n";
  }
	
}

close $fh_in;
close $fh_out;

print "done\n";
1;