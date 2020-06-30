module abundant_numbers

fn test_factor_calculation() {
	inp := [12, 15, 22]
	exp := [
		[1, 2, 3, 4, 6],
		[1, 3, 5],
		[1, 2, 11]
	]
	res := inp.map(get_factors(it))
	assert res == exp
}

fn test_factor_sum() {
	inp := [1, 2, 3, 4, 6]
	assert factor_sum(inp) == 16
}

fn test_is_abundant() {
	inp := [12, 42, 100]
	res := inp.map(is_abundant(it))
	for r in res {
		assert r == true
	}
}
