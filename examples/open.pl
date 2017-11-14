#!/usr/bin/perl

# There is an old style and a new stile for reading and writing files.
#
# References:
#
#   [perlmaven] https://perlmaven.com/open-files-in-the-old-way

use strict;
use warnings;

### Reading ###

# Bad:
open IN, $filename or die ...;

# Good
open my $in, '<', $filename or die ...;


### Writing ###

# Bad:
open IN, ">$filename" or die ...;

# Good:
open my $in, '>', $filename or die ...;
