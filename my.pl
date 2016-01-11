#!/usr/bin/perl -w

my $string = "We are the world";
print "$string\n";
myfunction();
print "$string\n";

sub myfunction
{
   my $string = "We are the function";
   print "$string\n";
   mysub();
}
sub mysub
{
   print "$string\n";
}
