/*
Sort a String

Given a string as input, output its characters alphabetically sorted from A to Z.

Rules:
  - Number should go first
  - Special characters, such as symbols, go before numbers and letters
  - Whitespaces should be ignored.
*/
module string_sort

pub fn sort(s string) string {
	mut chars := s.bytes().filter(it != ` `)
	quick_sort(mut chars, 0, chars.len - 1)
	mut sorted := ''
	for c in chars {
		sorted += c.str()
	}
	return sorted
}

fn quick_sort(mut chars []byte, l int, r int) {
	if l >= r {
		return
	}
	mut piv := l
	for i in l + 1 .. r + 1 {
		if chars[i] < chars[l] {
			piv++
			chars[i], chars[piv] = chars[piv], chars[i]
		}
	}
	chars[l], chars[piv] = chars[piv], chars[l]
	quick_sort(mut chars, l, piv - 1)
	quick_sort(mut chars, piv + 1, r)
}
