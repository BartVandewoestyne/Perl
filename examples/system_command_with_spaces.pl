#!/usr/bin/perl
#
use strict;
use warnings;

#my $winrar = "C:\\Program Files\\WinRAR\\WinRAR.exe";
#system($winrar, "h");

my $rar = "C:\\Program Files\\WinRAR\\Rar.exe";
system("\"$rar\" a test.zip D:\\GIT\\perl\\examples\\test.txt");

#chdir("C:\\Program Files\\WinRAR");
#system("rar a test.zip D:\\GIT\\perl\\examples\\test.txt");
