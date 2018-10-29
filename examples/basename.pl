#!/usr/bin/perl
use strict;
use warnings;

use File::Basename;

my $fname = "libICLogger.so.0.0.1134";
my ($name, $path, $suffix) = fileparse($fname, qr/[0-9]\.[0-9]\.[0-9]*/);
print "name = $name\n";
print "path = $path\n";
print "suffix = $suffix\n";

my @files = glob("libICLogger.so.[0-9].[0-9].[0-9]*");
foreach my $file (@files) {
  ($name, $path, $suffix) = fileparse($fname, qr/[0-9]\.[0-9]\.[0-9]*/);
  print "name = $name\n";
  print "path = $path\n";
  print "suffix = $suffix\n";
}

print "version = $suffix\n";
my ($major, $middle, $minor) = split('\.', $suffix);
print "major = $major\n";
print "middle = $middle\n";
print "minor = $minor\n";
