module gapful_numbers

fn test_is_gapful() {
	gapful_nums := [192, 583]
	for num in gapful_nums {
		res := is_gapful(num) or { panic(err) }
		assert res
	}
	ungapful_nums := [210, 1042]
	for num in ungapful_nums {
		res := is_gapful(num) or { panic(err) }
		assert !res
	}
}

fn test_errors_is_gapful() {
	input_map := {
		'Number should have at least three digits': [13, 99]
	}
	mut expected_err_count := 2
	for msg, inputs in input_map {
		for num in inputs {
			is_gapful(num) or {
				expected_err_count--
				assert err.msg == msg
			}
		}
	}
	assert expected_err_count == 0
}

fn test_gapful_range() {
	inputs := [[200, 250], [1030, 1045], [374, 396]]
	expected := [
		[200, 220, 225, 231, 240, 242],
		[1030, 1032, 1035, 1037, 1040],
		[374, 385, 390],
	]
	for i, inp in inputs {
		res := gapful_in_range(inp[0], inp[1]) or { panic(err) }
		exp := expected[i]
		assert res == exp
	}
}

fn test_errors_gapful_in_range() {
	input_map := {
		'´start´ has to be smaller than ´end´': [[200, 100],
			[100, 100]]
	}
	mut expected_err_count := 2
	for msg, inputs in input_map {
		for inp in inputs {
			gapful_in_range(inp[0], inp[1]) or {
				expected_err_count--
				assert err.msg == msg
			}
		}
	}
	assert expected_err_count == 0
}
