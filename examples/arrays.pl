# References:
#   [1] http://perlmaven.com/perl-arrays
#
my @names = ("Foo", "Bar", "Baz");

# iterate using foreach
foreach my $name (@names) {
    print "$name\n";
}

# iterate using indices ($#names is the largest index)
foreach my $i (0 .. $#names) {
    print "$i = ${names[$i]}\n";
}

# iterate over all except last element.
foreach my $i (0 .. $#names - 1) {
    print "$i = $names[$i]\n";
}
