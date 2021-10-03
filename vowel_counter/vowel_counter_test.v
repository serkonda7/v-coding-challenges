module vowel_counter

fn test_vowel_count() {
	strings := ['SoloLearn', 'Programming', 'Lorem Ipsum', 'Hello, World!', '']
	counts := [4, 3, 4, 3, 0]
	for i, str in strings {
		res := vowel_count(str)
		exp := counts[i]
		assert res == exp
	}
}
