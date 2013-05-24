#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/concept-2level.dt -o concept-2level  `;
is(@res, 0, 'No compilation errors');

@res = `./concept-2level`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ '6', '-4'
], 'Got expected results');

`rm concept-2level`;

1;
