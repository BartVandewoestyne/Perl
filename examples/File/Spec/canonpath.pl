#!/usr/bin/perl

use File::Spec;

#my $path = "/foo/bar";

# File::Spec->canonpath seems to leave the rest alone.
my $path = "./foo/bar --verbose -x";

$cpath = File::Spec->canonpath( $path ) ;

print "path = $path\n";
print "canonpath = $cpath\n";
