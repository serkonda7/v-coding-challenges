/*
Abundant Numbers
    https://en.wikipedia.org/wiki/Abundant_number

If the sum of factors of a number is greater than that number, it is considered to be abundant.

Tasks:
  - (Easy) Verify whether a given number is abundant or not.
  - (Medium) Find all the abundant numbers in a range.
  - (Hard) Given a number, display its factors, their sum and then verify whether it's abundant or not.
*/
module abundant_numbers

import util

pub fn is_abundant(num int) bool {
	sum := util.factor_sum(util.get_factors(num))
	return sum > num
}

pub fn abundant_in_range(start, end int) []int {
	mut are_abundant := []int{}
	for i in start .. end + 1 {
		if is_abundant(i) {
			are_abundant << i
		}
	}
	return are_abundant
}

pub fn get_abundancy(num int) int {
	sum := util.factor_sum(util.get_factors(num))
	return sum - num // Negative for non-abundant numbers
}
