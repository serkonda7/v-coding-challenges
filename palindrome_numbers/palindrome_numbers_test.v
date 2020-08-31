module palindrome_numbers

fn test_is_palindrome() {
	palindromes := [656, 111, 7337]
	for num in palindromes {
		assert is_palindrome(num) == true
	}
	others := [234, 42, 7347]
	for num in others {
		assert is_palindrome(num) == false
	}
}
