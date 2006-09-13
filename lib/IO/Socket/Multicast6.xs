#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "config.h"

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>


MODULE = IO::Socket::Multicast6	PACKAGE = IO::Socket::Multicast6


int
_get_mcast_ttl(sock,family)
	PerlIO* sock
	int family
  PREINIT:
	int fd;
	int ttl;
	socklen_t len;
  CODE:
	fd = PerlIO_fileno(sock);
	len = sizeof(ttl);
	
	if (family==AF_INET) {
		if (getsockopt(fd,IPPROTO_IP,IP_MULTICAST_TTL,(void*)&ttl,&len) < 0)
	 		XSRETURN_UNDEF;
	} else if (family==AF_INET6) {
		if (getsockopt(fd,IPPROTO_IPV6,IPV6_MULTICAST_HOPS,(void*)&ttl,&len) < 0)
	 		XSRETURN_UNDEF;
	} else {
		croak("_get_mcast_ttl failed, unsupported socket family: %d", family );
	}
   
   	RETVAL = ttl;
   	
  OUTPUT:
	RETVAL


void
_set_mcast_ttl(sock,family,ttl)
	PerlIO* sock
	int family
	int ttl;
  PREINIT:
	int fd;
  CODE:
	fd = PerlIO_fileno(sock);

	if (family==AF_INET) {
		if (setsockopt(fd,IPPROTO_IP,IP_MULTICAST_TTL,(void*)&ttl,sizeof(ttl)) < 0)
	 		XSRETURN_UNDEF;
	} else if (family==AF_INET6) {
		if (setsockopt(fd,IPPROTO_IPV6,IPV6_MULTICAST_HOPS,(void*)&ttl,sizeof(ttl)) < 0)
	 		XSRETURN_UNDEF;
	} else {
		croak("_set_mcast_ttl failed, unsupported socket family: %d", family );
	}



int
_get_mcast_loopback(sock,family)
	PerlIO* sock
	int family
  PREINIT:
	int fd;
	int loopback;
	socklen_t len;
  CODE:
	fd = PerlIO_fileno(sock);
	len = sizeof(loopback);
	
	if (family==AF_INET) {
		if (getsockopt(fd,IPPROTO_IP,IP_MULTICAST_LOOP,(void*)&loopback,&len) < 0)
	 		XSRETURN_UNDEF;
	} else if (family==AF_INET6) {
		if (getsockopt(fd,IPPROTO_IPV6,IPV6_MULTICAST_LOOP,(void*)&loopback,&len) < 0)
	 		XSRETURN_UNDEF;
	} else {
		croak("_get_mcast_ttl failed, unsupported socket family: %d", family );
	}
   
   	RETVAL = loopback;
   	
  OUTPUT:
	RETVAL


void
_set_mcast_loopback(sock,family,loopback)
	PerlIO* sock
	int family
	int loopback;
  PREINIT:
	int fd;
  CODE:
	fd = PerlIO_fileno(sock);

	if (family==AF_INET) {
		if (setsockopt(fd,IPPROTO_IP,IP_MULTICAST_LOOP,(void*)&loopback,sizeof(loopback)) < 0)
	 		XSRETURN_UNDEF;
	} else if (family==AF_INET6) {
		if (setsockopt(fd,IPPROTO_IPV6,IPV6_MULTICAST_LOOP,(void*)&loopback,sizeof(loopback)) < 0)
	 		XSRETURN_UNDEF;
	} else {
		croak("_set_mcast_loopback failed, unsupported socket family: %d", family );
	}


