module abundant_numbers

/*
https://en.wikipedia.org/wiki/Abundant_number

If the sum of factors of a number is greater than that number, it is considered to be abundant.

Tasks:
  - (Easy) Verify whether a given number is abundant or not.
  - (Medium) Find all the abundant numbers in a range.
  - (Hard) Given a number, display its factors, their sum and then verify whether it's abundant or not.
*/
import math
import util.factors

// is_abundant checks whether a numbers factor sum is greater than that number
pub fn is_abundant(num int) bool {
	if num <= 0 {
		return false
	}
	facs := factors.get_proper_factors(num) or { panic(err) }
	sum := factors.factor_sum(facs)
	return sum > num
}

// abundant_in_range returns all abundant numbers between ´min´ and ´max´ (exclusive)
pub fn abundant_in_range(min int, max int) ?[]int {
	if min >= max {
		return error('´min´ has to be smaller than ´max´')
	}
	rmin := int(math.max(min, 1))
	mut are_abundant := []int{}
	for i in rmin .. max {
		if is_abundant(i) {
			are_abundant << i
		}
	}
	return are_abundant
}

// get_abundancy returns the difference between a given numbers factor sum and the number
// Non-abundant numbers produce negative values
pub fn get_abundancy(num int) int {
	if num < 0 {
		return num
	}
	facs := factors.get_proper_factors(num) or { return 0 }
	sum := factors.factor_sum(facs)
	return sum - num
}
