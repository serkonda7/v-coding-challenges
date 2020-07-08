module password_validator

fn test_pw_length() {
	inp := ['1&Abc', '2&Abcde', '3&thisIsTooLong']
	exp := [false, true, false]
	res := inp.map(is_valid(it))
	assert res == exp
}

fn test_spaces() {
	inp := ['1&Ab cde', '2&Abcde']
	exp := [false, true]
	res := inp.map(is_valid(it))
	assert res == exp
}

fn test_numbers() {
	inp := ['@ABCdef', '&123hasNUM']
	exp := [false, true]
	res := inp.map(is_valid(it))
	assert res == exp
}

fn test_letter_case() {
	inp := ['@1onlylower', '@2HIGHCASE', '3@miXEd']
	exp := [false, false, true]
	res := inp.map(is_valid(it))
	assert res == exp
}

fn test_special_chars() {
	inp := ['noSpec1als', 'also3NONE', 'per?F3ct']
	exp := [false, false, true]
	res := inp.map(is_valid(it))
	assert res == exp
}
