module abundant_numbers

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
		[940, 942, 945, 948],
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
