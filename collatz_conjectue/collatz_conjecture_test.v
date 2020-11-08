module collatz_conjecture

const (
	exp_sequence = [
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
		'1 * 3 + 1 = 4',
	]
	exp_steps    = 13
)

fn test_get_sequence_iterative() {
	sequence, steps := get_sequence_iterative(17)
	assert sequence == exp_sequence
	assert steps == exp_steps
}
