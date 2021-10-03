module abundant_numbers

fn test_is_abundant() {
	// Abundant numbers
	abd_nums := [12, 42, 945]
	for num in abd_nums {
		assert is_abundant(num)
	}
	// Not abundant numbers
	unadb_nums := [1, 13, 28, 98]
	for num in unadb_nums {
		assert !is_abundant(num)
	}
	// 0 and negative
	other_nums := [-12, -1, 0]
	for num in other_nums {
		assert !is_abundant(num)
	}
}

fn test_abundant_in_range() {
	ranges := [[0, 19], [29, 42], [940, 950], [12, 18]]
	expected := [
		[12, 18],
		[30, 36, 40],
		[940, 942, 945, 948],
		[12],
	]
	for i, range in ranges {
		res := abundant_in_range(range[0], range[1]) or { panic(err) }
		exp := expected[i]
		assert res == exp
	}
}

fn test_errors_abundant_in_range() {
	input_map := {
		'´min´ has to be smaller than ´max´': [99, 77]
	}
	mut expexted_errors := 1
	for msg, range in input_map {
		abundant_in_range(range[0], range[1]) or {
			expexted_errors--
			assert err.msg == msg
		}
	}
	assert expexted_errors == 0
}

fn test_abundancy() {
	inputs := [-11, 0, 1, 12, 15, 18, 28, 70]
	expected := [-11, 0, -1, 4, -6, 3, 0, 4]
	for i, inp in inputs {
		exp := expected[i]
		assert get_abundancy(inp) == exp
	}
}
