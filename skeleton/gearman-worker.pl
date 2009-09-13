#!/usr/bin/env perl
use warnings;
use strict;

# Author: 
# Date:  {{ Date }}

use Gearman::Worker;
my $worker = Gearman::Worker->new;
$worker->job_servers('127.0.0.1');
$worker->register_function( 'get_script' => sub {
    my ( $pkgname, $script_id ) = split /,/, shift->arg;
    
    
} );
$worker->work while 1;
