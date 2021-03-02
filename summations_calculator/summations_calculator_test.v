module summations_calculator

struct Input {
	min        int
	max        int
	expression string
}

fn test_get_summation() {
	summations := [
		Input{1, 3, '+3'},
		Input{2, 4, '+ 2'},
		Input{10, 12, '-10'},
		Input{2, 4, '*2'},
		Input{3, 5, 'x3'},
		Input{4, 8, '/2'},
		Input{1, 5, '%2'},
	]
	expected := [15, 15, 3, 18, 36, 14, 3]
	for i, inp in summations {
		res := get_summation(inp.min, inp.max, inp.expression) or { panic(err) }
		exp := expected[i]
		assert res == exp
	}
}

fn test_errors() {
	mut errors := 0
	inp := Input{1, 3, 'y 3'}
	get_summation(inp.min, inp.max, inp.expression) or {
		errors++
		assert err.msg == 'Unknown type for expression: `y 3`'
	}
	assert errors == 1
}
