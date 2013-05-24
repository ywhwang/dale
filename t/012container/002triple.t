#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/triple.dt -o triple `;
is(@res, 0, 'No compilation errors');

@res = `./triple`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ '10 a 20' ], 'Got expected results');

`rm triple`;

1;
