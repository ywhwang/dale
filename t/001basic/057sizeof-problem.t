#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/sizeof-problem.dt -o sizeof-problem `;
is(@res, 0, 'No compilation errors');

@res = `./sizeof-problem`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [
'Size of 1 + 1 is: 4',
], 'Got expected results');

`rm sizeof-problem`;

1;
