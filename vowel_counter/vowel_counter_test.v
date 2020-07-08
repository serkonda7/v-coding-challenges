module vowel_counter

fn test_vowel_count() {
	inp := ['SoloLearn', 'Programming', 'Lorem Ipsum', 'Hello, World!']
	exp := [4, 3, 4, 3]
	res := inp.map(vowel_count(it))
	assert res == exp
}
