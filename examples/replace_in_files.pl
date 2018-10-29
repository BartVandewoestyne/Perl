#!/usr/bin/perl

use strict;
use warnings;

my @files = glob("*.prl");
foreach my $file (@files)
{
    # Read original file.
    open(FILE, "<$file") or die $!;
    my @lines = <FILE>;
    close(FILE);

    # Delete or replace text where necessary.
    my @newlines;
    foreach(@lines) {
        next if /^QMAKE_PRL_BUILD_DIR/;    # Remove lines starting with QMAKE_PRL_BUILD_DIR.
        $_ =~ s/(QMAKE_PRL_LIBS =).*/$1/;  # Clear the QMAKE_PRL_LIBS variable.
        push(@newlines, $_);
    }

    # Write modified content to file.
    open(FILE, ">$file") or die $!;
    print FILE @newlines;
    close(FILE)
}
