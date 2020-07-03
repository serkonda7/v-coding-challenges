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
	//TODO
}
