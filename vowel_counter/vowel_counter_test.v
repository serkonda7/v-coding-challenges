module vowel_counter

fn test_vowel_count() {
	strings := ['SoloLearn', 'Programming', 'Lorem Ipsum', 'Hello, World!']
	counts := [4, 3, 4, 3]
	for i, str in strings {
		assert vowel_count(str) == counts[i]
	}
}
