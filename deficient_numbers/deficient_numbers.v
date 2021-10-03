module deficient_numbers

/*
https://en.wikipedia.org/wiki/Deficient_number

A number is considered deficient if the sum of its factors is less than that number.

Tasks:
  - (Easy) Write a program to verify whether a given number is deficient or not.
  - (Medium) Write a program to find all the deficient numbers in a range.
  - (Hard) Given a number, write a program to display its factors, their sum and then verify whether it's deficient or not.
*/
import math
import util.factors

// is_deficient checks whether a number is deficient (see description above)
pub fn is_deficient(num int) bool {
	if num <= 0 {
		return false
	}
	facs := factors.get_proper_factors(num) or { panic(err) }
	sum := factors.factor_sum(facs)
	return sum < num
}

// deficient_in_range returns all deficient numbers between ´min´ and ´max´ (exclusive)
pub fn deficient_in_range(min int, max int) ?[]int {
	if min >= max {
		return error('´min´ has to be smaller than ´max´')
	}
	rmin := int(math.max(min, 1))
	mut are_deficient := []int{}
	for i in rmin .. max {
		if is_deficient(i) {
			are_deficient << i
		}
	}
	return are_deficient
}

// get_deficiency returns the difference between a given number and  its factor sum
// Non-deficient numbers produce negative values
pub fn get_deficiency(num int) int {
	facs := factors.get_proper_factors(num) or { return 0 }
	sum := factors.factor_sum(facs)
	return num - sum
}
