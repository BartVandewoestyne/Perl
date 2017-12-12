#!/usr/bin/perl
#
use strict;
use warnings;

my @fileNames = (".",
                 "..",
                 "SimCADInternalV0.2.110.exe",
                 "SimCADOEMV0.2.110.exe",
                 "SimCADViewerV0.2.110.exe");

foreach my $file (@fileNames)
{
    if ($file =~ /(\d+.\d+.\d+)/)
    {
        my $version = $1;
        print $version, "\n";
    }
}
