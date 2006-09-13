#!/usr/bin/perl

use strict;
use lib '../blib/lib','../blib/arch';
use IO::Socket::Multicast6;

use constant GROUP => 'ff15::9023';
use constant PORT  => '2000';

my $sock = IO::Socket::Multicast6->new(
					LocalAddr=>GROUP,
					LocalPort=>PORT,
					Domain=>AF_INET6,
					ReuseAddr=>1);
					
$sock->mcast_add(GROUP) || die "Couldn't join group: $!\n";

while (1) {
	my $data;
	next unless $sock->recv($data,1024);
	print "$data\n";
}
