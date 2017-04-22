#!/usr/bin/perl
#
# Test how the return value from the copy function behaves.

use File::Copy;

my $copy_status = copy("src.txt", "dst.txt");
if ($copy_status != 1)
{
    print("Failed to copy src.txt to dst.txt!\n");
}
