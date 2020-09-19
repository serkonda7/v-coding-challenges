module abundant_numbers

fn test_is_abundant() {
	// Abundant numbers
	abd_nums := [12, 42, 945]
	for num in abd_nums {
		res := is_abundant(num)
		assert res == true
	}
	// Not abundant numbers
	unadb_nums := [1, 13, 28, 98]
	for num in unadb_nums {
		res := is_abundant(num)
		assert res == false
	}
	// 0 and negative
	other_nums := [-12, -1, 0]
	for num in other_nums {
		res := is_abundant(num)
		assert res == false
	}
}

fn test_abundant_range() {
	ranges := [[0, 19], [29, 42], [940, 950]]
	expected := [
		[12, 18],
		[30, 36, 40],
		[940, 942, 945, 948],
	]
	for i, range in ranges {
		res := abundant_in_range(range[0], range[1])
		exp := expected[i]
		assert res == exp
	}
}

fn test_abundancy() {
	inp := [1, 12, 15, 18, 28, 70]
	exp := [-1, 4, -6, 3, 0, 4]
	res := inp.map(get_abundancy(it))
	assert res == exp
}
