#!/usr/bin/perl

# References:
#
#   [perlmaven] https://perlmaven.com/die

use strict;
use warnings;
use 5.010;

#die "Big problem reported with die + newline...\n";

# If you leaving out the trailing new-line, then the output will include the
# name of the file and the line number where the warn function was called.
die "Big problem reported with die, but without newline.";

say "End of script.";
