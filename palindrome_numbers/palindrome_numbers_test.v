module palindrome_numbers

fn test_is_palindrome() {
	inp := [656, 111, 7337, 234, 42, 7347]
	exp := [true, true, true, false, false, false]
	res := inp.map(is_palindrome(it))
	assert res == exp
}
