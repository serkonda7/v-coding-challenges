module happy_numbers

fn test_is_happy() {
	happy_nums := [1, 23, 100]
	for num in happy_nums {
		res := is_happy(num)
		assert res == true
	}
	unhappy_nums := [4, 15, 22]
	for num in unhappy_nums {
		res := is_happy(num)
		assert res == false
	}
}

fn test_happy_range() {
	inputs := [[1, 18], [95, 105]]
	expected := [
		[1, 7, 10, 13],
		[97, 100, 103],
	]
	for i, inp in inputs {
		res := happy_in_range(inp[0], inp[1])
		exp := expected[i]
		assert res == exp
	}
}

fn test_square_steps() {
	inputs := [13, 24]
	expected := [
		['1 * 1 + 3 * 3 = 10', '1 * 1 + 0 * 0 = 1'],
		['2 * 2 + 4 * 4 = 20', '2 * 2 + 0 * 0 = 4'],
	]
	for i, inp in inputs {
		_, steps := square_steps(inp)
		exp := expected[i]
		assert steps == exp
	}
}
