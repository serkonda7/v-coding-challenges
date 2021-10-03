module deficient_numbers

fn test_is_deficient() {
	// Deficient numbers
	def_nums := [1, 2, 10, 86, 107]
	for num in def_nums {
		assert is_deficient(num)
	}
	// Not deficient numbers
	undef_nums := [18, 6, 42]
	for num in undef_nums {
		assert !is_deficient(num)
	}
	// 0 and negative
	other_nums := [-12, -1, 0]
	for num in other_nums {
		assert !is_deficient(num)
	}
}

fn test_deficient_in_range() {
	ranges := [[0, 7], [36, 42], [99, 107]]
	expected := [
		[1, 2, 3, 4, 5],
		[37, 38, 39, 41],
		[99, 101, 103, 105, 106],
	]
	for i, range in ranges {
		res := deficient_in_range(range[0], range[1]) or { panic(err) }
		exp := expected[i]
		assert res == exp
	}
}

fn test_errors_deficient_in_range() {
	input_map := {
		'´min´ has to be smaller than ´max´': [99, 77]
	}
	mut expexted_errors := 1
	for msg, range in input_map {
		deficient_in_range(range[0], range[1]) or {
			expexted_errors--
			assert err.msg == msg
		}
	}
	assert expexted_errors == 0
}

fn test_deficiency() {
	inputs := [-12, 0, 1, 21, 28, 42, 50]
	expected := [-12, 0, 1, 10, 0, -12, 7]
	for i, inp in inputs {
		exp := expected[i]
		assert get_deficiency(inp) == exp
	}
}
