#!/usr/bin/perl

use Cwd;
use File::Basename;

my $cwd = getcwd();
print("$cwd\n");

$cwd = cwd();
print("$cwd\n");

$test = dirname(dirname($cwd));
print("$test/osswin\n");
