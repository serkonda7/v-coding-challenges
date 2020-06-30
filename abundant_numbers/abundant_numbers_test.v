module abundant_numbers

fn test_factor_calculation() {
	inp := [12, 15, 945]
	exp := [
		[1, 2, 3, 4, 6],
		[1, 3, 5],
		[1, 3, 5, 7, 9, 15, 21, 27, 35, 45, 63, 105, 135, 189, 315]
	]
	res := inp.map(get_factors(it))
	assert res == exp
}

fn test_factor_sum() {
	inp := [1, 2, 3, 4, 6]
	assert factor_sum(inp) == 16
}

fn test_is_abundant() {
	inp := [12, 42, 945, 13, 28, 98]
	exp := [true, true, true, false, false, false]
	res := inp.map(is_abundant(it))
	assert res == exp
}

fn test_abundant_range() {
	inp := [[0, 19], [29, 42], [940, 950]]
	exp := [
		[12, 18],
		[30, 36, 40, 42],
		[940, 942, 945, 948]
	]
	res := inp.map(abundant_in_range(it[0], it[1]))
	assert res == exp
}

fn test_abundancy() {
	inp := [12, 18, 70, 28, 15]
	exp := [4, 3, 4, 0, -6]
	res := inp.map(get_abundancy(it))
	assert res == exp
}
