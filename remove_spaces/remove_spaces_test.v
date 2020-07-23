module remove_spaces

fn test_remove_spaces() {
	inp := [
		'ab c  d e fgh i  j kl mn  opqr  stuvwxyz', 'null', '  ',
		' before', 'after  ',
	]
	exp := [
		'abcdefghijklmnopqrstuvwxyz', 'null', '',
		'before', 'after',
	]
	res := inp.map(remove_whitespace(it))
	assert res == exp
}
