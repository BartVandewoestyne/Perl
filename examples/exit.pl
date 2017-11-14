#!/usr/bin/perl

# References:
#
#   [perlmaven] https://perlmaven.com/how-to-exit-from-perl-script

use strict;
use warnings;
use 5.010;

# The call to system will return the exit code from the script.
say system "perl script_with_non_default_exit_value.pl";

# The exit code is also saved in the $? variable of Perl.
say $?;

# The important thing to note is that this value contains 2 bytes and the
# actual exit code is in the upper byte.  So in order to get back the exit code
# from the script that we called, we have to right-shift the bits using the >>
# bitwise operator with 8 bits.
say $? >> 8;
