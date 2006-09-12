#!/usr/bin/perl

use strict;
use lib '../blib/lib','../blib/arch';
use IO::Socket::Multicast6;

use constant DESTINATION => '127.0.0.1:2000';

my $sock = new IO::Socket::Multicast6(
					Domain=>AF_INET,
					ReuseAddr=>1);

print "Result of set mcast_ttl: ".$sock->mcast_ttl(5)."\n";
		
print "Socket's domain: ".$sock->sockdomain()."\n";
print "Socket's multicast ttl: ".$sock->mcast_ttl()."\n";
print "Socket's multicast loopback: ".$sock->mcast_loopback()."\n";


while (1) {
  my $message = localtime();
  $sock->mcast_send($message,DESTINATION) || die "Couldn't send: $!";
} continue {
  sleep 5;
}
