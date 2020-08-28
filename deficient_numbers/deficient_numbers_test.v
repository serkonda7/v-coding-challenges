module deficient_numbers

fn test_is_deficient() {
	inp := [1, 2, 10, 86, 18, 6, 42]
	exp := [true, true, true, true, false, false, false]
	res := inp.map(is_deficient(it))
	assert res == exp
}

fn test_deficient_range() {
	inp := [[0, 7], [36, 42]]
	exp := [
		[1, 2, 3, 4, 5, 7],
		[37, 38, 39, 41],
	]
	res := inp.map(deficient_in_range(it[0], it[1]))
	assert res == exp
}

fn test_deficiency() {
	inp := [1, 21, 50, 28, 42]
	exp := [1, 10, 7, 0, -12]
	res := inp.map(get_deficiency(it))
	assert res == exp
}
