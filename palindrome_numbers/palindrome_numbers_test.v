module palindrome_numbers

fn test_is_palindrome() {
	palindromes := [656, 111, 7337]
	for num in palindromes {
		res := is_palindrome(num)
		assert res == true
	}
	others := [234, 42, 7347]
	for num in others {
		res := is_palindrome(num)
		assert res == false
	}
}
