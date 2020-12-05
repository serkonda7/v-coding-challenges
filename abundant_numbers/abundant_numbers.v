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

import math
import util.factors

pub fn is_abundant(num int) bool {
	if num <= 0 {
		return false
	}
	facs := factors.get_proper_factors(num) or { panic(err) }
	sum := factors.factor_sum(facs)
	return sum > num
}

pub fn abundant_in_range(min int, max int) []int {
	rmin := int(math.max(min, 1))
	mut are_abundant := []int{}
	for i in rmin .. max {
		if is_abundant(i) {
			are_abundant << i
		}
	}
	return are_abundant
}

pub fn get_abundancy(num int) int {
	facs := factors.get_proper_factors(num) or { panic(err) }
	sum := factors.factor_sum(facs)
	// Negative value for non-abundant numbers
	return sum - num
}
