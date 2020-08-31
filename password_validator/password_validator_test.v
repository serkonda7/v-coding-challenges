module password_validator

fn test_pw_length() {
	passwords := ['1&Abc', '2&Abcde', '3&thisIsTooLong']
	expected := [false, true, false]
	for i, pw in passwords {
		assert is_valid(pw) == expected[i]
	}
}

fn test_spaces() {
	passwords := ['1&Ab cde', '2&Abcde']
	expected := [false, true]
	for i, pw in passwords {
		assert is_valid(pw) == expected[i]
	}
}

fn test_numbers() {
	passwords := ['@ABCdef', '&123hasNUM']
	expected := [false, true]
	for i, pw in passwords {
		assert is_valid(pw) == expected[i]
	}
}

fn test_letter_case() {
	passwords := ['@1onlylower', '@2HIGHCASE', '3@miXEd']
	expected := [false, false, true]
	for i, pw in passwords {
		assert is_valid(pw) == expected[i]
	}
}

fn test_special_chars() {
	passwords := ['noSpec1als', 'also3NONE', 'per?F3ct']
	expected := [false, false, true]
	for i, pw in passwords {
		assert is_valid(pw) == expected[i]
	}
}
