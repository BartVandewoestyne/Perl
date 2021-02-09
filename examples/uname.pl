use POSIX qw(uname);

my ($sysname, $nodename, $release, $version, $machine) = uname();
print "sysname = $sysname\n";
print "nodename = $nodename\n";
print "release = $release\n";
print "version = $version\n";
print "machine = $machine\n";
