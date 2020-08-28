module util

fn test_factor_calculation() {
	inp := [12, 15, 945]
	exp := [
		[1, 2, 3, 4, 6],
		[1, 3, 5],
		[1, 3, 5, 7, 9, 15, 21, 27, 35, 45, 63, 105, 135, 189, 315],
	]
	res := inp.map(get_factors(it))
	assert res == exp
}

fn test_factor_sum() {
	inp := [1, 2, 3, 4, 6]
	assert factor_sum(inp) == 16
}
