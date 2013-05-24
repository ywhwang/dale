#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/arity.dt -o arity `;
is(@res, 0, 'No compilation errors');

@res = `./arity`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ 1, 1, 3 ], 'Got expected results');

`rm arity`;

1;
