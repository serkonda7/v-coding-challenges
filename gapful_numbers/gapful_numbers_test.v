module gapful_numbers

fn test_is_gapful() {
	gapful_nums := [192, 583]
	for num in gapful_nums {
		res := is_gapful(num)
		assert res == true
	}
	ungapful_nums := [210, 1042]
	for num in ungapful_nums {
		res := is_gapful(num)
		assert res == false
	}
}

fn test_gapful_range() {
	inputs := [[200, 250], [1030, 1045]]
	expected := [
		[200, 220, 225, 231, 240, 242],
		[1030, 1032, 1035, 1037, 1040],
	]
	for i, inp in inputs {
		res := gapful_in_range(inp[0], inp[1])
		exp := expected[i]
		assert res == exp
	}
}
