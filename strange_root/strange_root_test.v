module strange_root

fn test_has_strange_root() {
	strange_root_nums := [0, 2, 11, 204]
	for num in strange_root_nums {
		res := has_strange_root(num) or { panic(err) }
		assert res
	}
	normal_nums := [3, 24]
	for num in normal_nums {
		res := has_strange_root(num) or { panic(err) }
		assert !res
	}
}

fn test_errors_has_strange_root() {
	input_map := {
		'Square root of negative numbers cannot be calculated': [-4, -72]
	}
	mut expected_err_count := 2
	for msg, inputs in input_map {
		for num in inputs {
			has_strange_root(num) or {
				expected_err_count--
				assert err.msg == msg
			}
		}
	}
	assert expected_err_count == 0
}
