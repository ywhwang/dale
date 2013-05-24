#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/struct-init.dt -o struct-init  `;
is(@res, 0, 'No compilation errors');

@res = `./struct-init`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ '1 2' ], 'Got expected results');

`rm struct-init`;

1;
