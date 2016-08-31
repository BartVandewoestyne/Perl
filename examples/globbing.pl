# References:
#
#   [1] Learning Perl, 2nd Edition, O'Reilly, page 130.

#!/usr/bin/perl

## List context.

# Single pattern

@a = glob("*.pl");
print "@a\n";

@b = <*.pl>;
print "@b\n";

# Multiple patterns

@c = glob("*.pl xml*");
print "@c\n";

@d = <*.pl xml*>;
print "@d\n";

## Scalar context.

while ($thefile = <*.pl>) {
    print "one of the files is $thefile\n";
}
