module happy_numbers

fn test_is_happy() {
	happy_nums := [1, 23, 100]
	for num in happy_nums {
		assert is_happy(num) == true
	}
	unhappy_nums := [4, 15, 22]
	for num in unhappy_nums {
		assert is_happy(num) == false
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
		assert res == expected[i]
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
		assert steps == expected[i]
	}
}
