#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Std;

our($opt_r);

# -r is a boolean flag, sets $opt_r as a side effect.
getopts('r');

if (defined $opt_r) {
  print "opt_r is defined\n";
} else {
  print "opt_r is not defined\n";
}
