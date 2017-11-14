#!/usr/bin/perl

# References:
#
#   [perlmaven] https://perlmaven.com/warn

use strict;
use warnings;
use 5.010;

# Old way to report errors, not recommended.
print STDERR "Slight problem reported with print and STDERR...\n";

# Better, more standard way for the following reasons:
#   1) shorter
#   2) more expressive
warn "Slight problem reported with warn + newline...\n";

# Note that script keeps running after the warning message!
say "Doing stuff after giving a warning.";

# If you leaving out the trailing new-line, then the output will include the
# name of the file and the line number where the warn function was called.
warn "Slight problem reported with warn, but without newline.";

say "End of script.";
