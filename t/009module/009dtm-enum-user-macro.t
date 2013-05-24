#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 4;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/dtm-enum.dt -o ./t.dt.o -c -m ./dtm-enum`;
is_deeply(\@res, [], 'no compilation errors');

@res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/dtm-enum-user-macro.dt -o dtm-enum-user-macro`;
chomp for @res;
is_deeply(\@res, 
          [ '0 1 2 1 2 0 -1 0 1 2 3' ], 
          'no compilation errors (got expected macro output)');

@res = `./dtm-enum-user-macro`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, 
          [],
          'Got expected results');

`rm libdtm-enum.so`;
`rm libdtm-enum-nomacros.so`;
`rm libdtm-enum.dtm`;
`rm libdtm-enum.bc`;
`rm libdtm-enum-nomacros.bc`;
`rm dtm-enum-user-macro`;

1;
