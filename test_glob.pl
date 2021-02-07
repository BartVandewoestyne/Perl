#!/usr/bin/perl

@pro_files = glob("*.pl");
foreach $j (@pro_files) {
    print "$j\n";
}
