/*
Gapful Numbers

A gapful number is a number of at least 3 digits that is divisible by the number formed by the first and last digit of the original number.

Write a program to check if the user input is a gapful number or not.
*/
module gapful_numbers

pub fn is_gapful(num int) bool {
	num_str := num.str().bytes()
	divisor_str := num_str[0].str() + num_str.last().str()
	divisor := divisor_str.int()
	res := num % divisor
	return res == 0
}

pub fn gapful_in_range(start int, end int) []int {
	mut are_gapful := []int{}
	for i in start .. end + 1 {
		if is_gapful(i) {
			are_gapful << i
		}
	}
	return are_gapful
}
