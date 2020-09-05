/*
Strange Root

A number has a strange root if its square and square root share any digit. For example, 2 has a strange root because the square root of 2 equals 1.414 (consider the first three digits after the dot) and it contains 4 (which is the square of 2).

Write a program to check if the user input has a strange root or not.
*/
module strange_root

import math

pub fn has_strange_root(num int) bool {
	square := num * num
	root := math.sqrtf(num)
	sqr_str := square.str()
	root_chars := root.str()[0..5]
	return sqr_str.contains_any(root_chars)
}
