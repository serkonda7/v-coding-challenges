module vowel_counter

/*
Five of the 26 English alphabet letters are vowels: A, E, I, O, and U.

Write a program that takes string input and outputs the count of the vowels in the string.
*/

const vowel_str = 'aeiou'

// vowel_count returns the number of vowels in a given string
pub fn vowel_count(str string) int {
	chars := str.to_lower().split('')
	vowels := chars.filter(vowel_counter.vowel_str.contains(it))
	return vowels.len
}
