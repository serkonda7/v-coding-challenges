/* Vowels

Five of the 26 English alphabet letters are vowels: A, E, I, O, and U.

Write a program that takes string input and outputs the count of the vowels in the string.
*/
module vowel_counter

const (
	vowel_str = 'aeiou'
)

pub fn vowel_count(str string) int {
	chars := str.to_lower().split('')
	vowels := chars.filter(it in vowel_str)
	return vowels.len
}
