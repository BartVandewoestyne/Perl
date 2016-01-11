#!/usr/bin/perl
#
# Program to illustrate what severel built-in perl variables are.
#
# References:
#   [1] http://perldoc.perl.org/perlvar.html

# Within a subroutine the array @_ contains the parameters passed to that
# subroutine.  Inside a subroutine,  is the default array for the array
# operators push, pop, shift, and unshift.
sub f {
    my($key, $value) = @_;
    print "key = $key\n";
    print "value = $value\n";
}

print "Hello world!\n";
f(5, 7);
