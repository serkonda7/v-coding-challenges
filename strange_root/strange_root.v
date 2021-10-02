module strange_root

/*
A number has a strange root if its square and square root share any digit.

> For example, 2 has a strange root because the square root of 2 equals 1.414 and it contains 4.

Write a program to check if the user input has a strange root or not.
Only consider the first three digits after the dot.
*/
import math

// has_strange_root checks whether a number has a strange root (see description above)
pub fn has_strange_root(num int) ?bool {
	if num < 0 {
		return error('Square root of negative numbers cannot be calculated')
	}

	square := num * num
	root := math.sqrtf(num)

	sqr_str := square.str()
	root_str := root.str()

	max_chars_count := if root_str.len >= 5 { 5 } else { root_str.len }
	root_chars := root.str()[0..max_chars_count]

	return sqr_str.contains_any(root_chars)
}
