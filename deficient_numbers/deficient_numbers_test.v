module deficient_numbers

fn test_is_deficient() {
	// Deficient numbers
	abd_nums := [1, 2, 10, 86]
	for num in abd_nums {
		res := is_deficient(num)
		assert res == true
	}
	// Not deficient numbers
	unadb_nums := [18, 6, 42]
	for num in unadb_nums {
		res := is_deficient(num)
		assert res == false
	}
	// 0 and negative
	other_nums := [-12, -1, 0]
	for num in other_nums {
		res := is_deficient(num)
		assert res == false
	}
}

fn test_deficient_range() {
	ranges := [[0, 7], [36, 42]]
	expected := [
		[1, 2, 3, 4, 5],
		[37, 38, 39, 41],
	]
	for i, range in ranges {
		res := deficient_in_range(range[0], range[1])
		assert res == expected[i]
	}
}

fn test_deficiency() {
	inp := [1, 21, 28, 42, 50]
	exp := [1, 10, 0, -12, 7]
	res := inp.map(get_deficiency(it))
	assert res == exp
}
