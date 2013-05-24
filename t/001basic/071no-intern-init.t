#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/no-intern-init.dt -o no-intern-init `;
is(@res, 0, 'No compilation errors');

@res = `./no-intern-init`;
is($?, 0, 'Program executed successfully');

chomp for @res;
is_deeply(\@res, [
    '0', '0 0'
], 'Got expected results');

`rm no-intern-init`;

1;
