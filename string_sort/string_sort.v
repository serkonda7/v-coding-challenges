module string_sort

/*
Given a string as input, output its characters alphabetically sorted from A to Z.

Rules:
  - Special characters should go first.
  - Numbers should be before letters.
  - Whitespaces should be ignored.
*/
import util.algorithm

// sort returns a given string sorted alphabetically
pub fn sort(s string) string {
	mut chars := s.bytes().filter(it != ` `)
	algorithm.quick_sort(mut chars, 0, chars.len - 1)
	mut sorted := ''
	for c in chars {
		sorted += c.ascii_str()
	}
	return sorted
}
