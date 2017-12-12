#!/usr/bin/perl

# References
#
#   [perldoc] https://perldoc.perl.org/constant.html

use strict;
use warnings;

# Constants defined like this cannot be interpolated into strings like
# variables.  However, concatenation works just fine:
use constant FIRST_NAME => "John";
#print "My first name is $FIRST_NAME.\n";      # doesn't work
print "My first name is ", FIRST_NAME, ".\n";  # works

# For ordinary variables, interpolation into strings and concatenation both
# work fine.
my $lastName = "Doe";
print "My last name is $lastName.\n";        # works
print "My last name is ", $lastName, ".\n";  # works
