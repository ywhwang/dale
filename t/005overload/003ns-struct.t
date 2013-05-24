#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/over-ns-struct.dt -o over-ns-struct `;
is(@res, 0, 'No compilation errors');

@res = `./over-ns-struct`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ 
    '3000', '3000', '3000', '1000', '2000', '1000'
], 'Got expected results');

`rm over-ns-struct`;

1;
