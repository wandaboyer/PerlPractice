#!/usr/bin/perl
use strict;
use warnings;

use Digest::MD5 'md5_hex';

my $data = hex '0xAf';

my $digest = md5_hex($data);

print $digest;

