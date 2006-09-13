#!/usr/bin/perl

use strict;
use lib '../blib/lib','../blib/arch';
use IO::Socket::Multicast6;

use constant GROUP => 'ff15::9023';
use constant PORT  => '2000';

my $sock = new IO::Socket::Multicast6(
					PeerAddr=>GROUP,
					PeerPort=>PORT,
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
