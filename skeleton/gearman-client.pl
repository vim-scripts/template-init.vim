#!/usr/bin/env perl
use warnings;
use strict;

# Author: Cornelius
# Date: Sun Sep 13 13:12:13 2009 
use Gearman::Client;
my $client = Gearman::Client->new;
$client->job_servers('127.0.0.1');

# running a single task
my $result_ref = $client->do_task("add", "1+2");
print "1 + 2 = $$result_ref\n";

# waiting on a set of tasks in parallel
my $taskset = $client->new_task_set;
$taskset->add_task( "add" => "1+2", {
    on_complete => sub { ... }
});
$taskset->add_task( "divide" => "5/0", {
    on_fail => sub { print "divide by zero error!\n"; },
});
$taskset->wait;
