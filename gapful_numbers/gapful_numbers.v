module gapful_numbers

/*
A gapful number is a number of at least 3 digits that is divisible by the number formed by
the first and last digit of the original number.

Write a program to check if the user input is a gapful number or not.
*/

// is_gapful checks whether a given number is gapful (see description above)
pub fn is_gapful(num int) ?bool {
	if num < 100 {
		return error('Number should have at least three digits')
	}
	num_str := num.str().bytes()
	divisor_str := num_str[0].ascii_str() + num_str.last().ascii_str()
	divisor := divisor_str.int()
	res := num % divisor
	return res == 0
}

// gapful_in_range returns all gapful numbers between ´start´ and ´end´ (exclusive)
pub fn gapful_in_range(start int, end int) ?[]int {
	if start >= end {
		return error('´start´ has to be smaller than ´end´')
	}
	mut are_gapful := []int{}
	for i in start .. end {
		if is_gapful(i) or { false } {
			are_gapful << i
		}
	}
	return are_gapful
}
