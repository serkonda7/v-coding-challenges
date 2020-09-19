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
		res := remove_whitespace(inp)
		exp := expected[i]
		assert res == exp
	}
}
