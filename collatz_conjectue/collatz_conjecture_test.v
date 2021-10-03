module collatz_conjecture

struct Input {
	num      int
	sequence []string
}

const inputs = build_inputs()

fn build_inputs() []Input {
	mut inputs := []Input{}
	inputs << Input{
		num: 17
		sequence: [
			'17 * 3 + 1 = 52',
			'52 / 2 = 26',
			'26 / 2 = 13',
			'13 * 3 + 1 = 40',
			'40 / 2 = 20',
			'20 / 2 = 10',
			'10 / 2 = 5',
			'5 * 3 + 1 = 16',
			'16 / 2 = 8',
			'8 / 2 = 4',
			'4 / 2 = 2',
			'2 / 2 = 1',
		]
	}
	return inputs
}

fn test_get_sequence_iterative() {
	for inp in collatz_conjecture.inputs {
		seq, steps := get_sequence_iterative(inp.num) or { panic(err) }
		assert seq == inp.sequence
		assert steps == inp.sequence.len
	}
}

fn test_get_sequence_recursive() {
	for inp in collatz_conjecture.inputs {
		seq, steps := get_sequence_recursive(inp.num) or { panic(err) }
		assert seq == inp.sequence
		assert steps == inp.sequence.len
	}
}

fn test_errors() {
	input_map := {
		'Input has to be an natural number': [0, -2]
	}
	mut expexted_errors := 4
	for msg, inputs in input_map {
		for inp in collatz_conjecture.inputs {
			get_sequence_iterative(inp) or {
				expexted_errors--
				assert err.msg == msg
			}
			get_sequence_recursive(inp) or {
				expexted_errors--
				assert err.msg == msg
			}
		}
	}
	assert expexted_errors == 0
}
