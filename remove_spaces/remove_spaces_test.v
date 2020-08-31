module remove_spaces

fn test_remove_spaces() {
	inputs := [
		'ab c  d e fgh i  j kl mn  opqr  stuvwxyz',
		'null',
		'  ',
		' before',
		'after  ',
	]
	expected := [
		'abcdefghijklmnopqrstuvwxyz',
		'null',
		'',
		'before',
		'after',
	]
	for i, inp in inputs {
		assert remove_whitespace(inp) == expected[i]
	}
}
