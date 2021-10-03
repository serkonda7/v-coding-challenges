module remove_spaces

fn test_remove_spaces() {
	inputs := [
		'ab c  d e fgh i  j kl mn  opqr  stuvwxyz',
		'null',
		'  ',
		' before',
		'after  ',
		'\tfo o\t',
		'spam\neggs And Ham',
	]
	expected := [
		'abcdefghijklmnopqrstuvwxyz',
		'null',
		'',
		'before',
		'after',
		'\tfoo\t',
		'spam\neggsAndHam',
	]
	for i, inp in inputs {
		res := remove_spaces(inp)
		exp := expected[i]
		assert res == exp
	}
}
