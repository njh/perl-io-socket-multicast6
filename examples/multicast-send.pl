#!/usr/bin/perl

use strict;
use lib '../blib/lib','../blib/arch';
use IO::Socket::Multicast6;


my $sock = new IO::Socket::Multicast6(
					PeerAddr=>'ff15::9023',
					PeerPort=>2000,
					Domain=>AF_INET6,
					ReuseAddr=>1);


$sock->mcast_ttl(5) || die "Failed to set TTL: $!";
$sock->mcast_loopback(1) || die "Failed to enable loopback: $!";

while (1) {
	my $message = localtime();
	$sock->send($message) || die "Couldn't send: $!";
	print "Sent: $message\n";
} continue {
	sleep 4;
}
