#!/usr/bin/perl
#
# References:
#
#   [perldoc] http://perldoc.perl.org/functions/system.html

my $command = "ls";

my $result = system($command);
print("system(\"$command\") returned $result.\n");

# A return value of -1 indicates a failure to start the program or an error
# of the wait(2) system call (inspect $! for the reason).
if ($? == -1) {
    print "failed to execute: $!\n";
}
elsif ($? & 127) {
    printf "child died with signal %d, %s coredump\n",
        ($? & 127),  ($? & 128) ? 'with' : 'without';
}
else {
    printf "child exited with value %d\n", $? >> 8;
}
