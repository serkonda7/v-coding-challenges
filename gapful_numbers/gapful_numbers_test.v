module gapful_numbers

fn test_is_gapful() {
	inp := [192, 583, 210]
	exp := [true, true, false]
	res := inp.map(is_gapful(it))
	assert res == exp
}

fn test_gapful_range() {
	inp := [[200, 250], [1030, 1045]]
	exp := [
		[200, 220, 225, 231, 240, 242],
		[1030, 1032, 1035, 1037, 1040],
	]
	res := inp.map(gapful_in_range(it[0], it[1]))
	assert res == exp
}
