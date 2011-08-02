use strict;
use warnings;
use Test::More;

use Function::Parameters;

fun const($x)() { $x }

fun whatev($x)($y1, $y2)($z) { $x + $y1 * $y2 - $z }

fun cprod(@x)(@y) {
	my @r;
	for my $x (@x) {
		for my $y (@y) {
			push @r, [$x, $y];
		}
	}
	@r
}

is const(42)->(0), 42;
is_deeply [cprod('A', 'B')->(1, 2, 3)], [['A', 1], ['A', 2], ['A', 3], ['B', 1], ['B', 2], ['B', 3]];
is whatev(100)->(6, 7)(5), 137;

my $add = fun ($x)($y) { $x + $y };
my $succ = $add->(1);

is $succ->(1), 2;
is $succ->(9), 10;
is $succ->(2), 3;

done_testing;
