
use strict;
use Test;


# use a BEGIN block so we print our plan before IO::Socket::Multicast6 is loaded
BEGIN { plan tests => 3 }

# load IO::Socket::Multicast6
use IO::Socket::Multicast6;


# Helpful notes.  All note-lines must start with a "#".
print "# I'm testing IO::Socket::Multicast6 version $IO::Socket::Multicast6::VERSION\n";

# Module has loaded sucessfully 
ok(1);



# Now try creating a new IO::Socket::Multicast6 socket
my $io = new IO::Socket::Multicast6();

ok( $io );


# Close the socket
$io->close();

ok(1);


exit;

