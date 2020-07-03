module happy_numbers

fn test_is_happy() {
	inp := [1, 23, 100, 4, 15, 22]
	exp := [true, true, true, false, false, false]
	res := inp.map(is_happy(it))
	assert res == exp
}

fn test_happy_range() {
	inp := [[1, 18], [95, 105]]
	exp := [
		[1, 7, 10, 13],
		[97, 100, 103]
	]
	res := inp.map(happy_in_range(it[0], it[1]))
	assert res == exp
}

fn test_square_steps() {
	inp := [13, 24]
	exp := [
		['1 * 1 + 3 * 3 = 10', '1 * 1 + 0 * 0 = 1'],
		['2 * 2 + 4 * 4 = 20', '2 * 2 + 0 * 0 = 4']
	]
	for idx, i in inp {
		_, steps := square_steps(i)
		assert steps == exp[idx]
	}
}
