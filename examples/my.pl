# Example on the my-function
#
# References:
#   [1] http://perldoc.perl.org/functions/my.html
#   [2] http://perldoc.perl.org/perlsub.html#Private-Variables-via-my()

#!/usr/bin/perl -W

my $string = "A my-string in the global space";
print "Inside global space: $string\n";

myfunction();

sub myfunction
{
   my $string = "A my-string inside a subroutine";
   print "Inside myfunction: $string\n";
   mysub();
}

sub mysub
{
   print "Inside mysub: $string\n";
}
