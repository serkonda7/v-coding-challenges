/*
Deficient Numbers
    https://en.wikipedia.org/wiki/Deficient_number

A number is considered deficient if the sum of its factors is less than that number.

Tasks:
  - (Easy) Write a program to verify whether a given number is deficient or not.
  - (Medium) Write a program to find all the deficient numbers in a range.
  - (Hard) Given a number, write a program to display its factors, their sum and then verify whether it's deficient or not.
*/
module deficient_numbers

import util.factors

pub fn is_deficient(num int) bool {
	facs := factors.get_proper_factors(num) or {
		panic(err)
	}
	sum := factors.factor_sum(facs)
	println(sum)
	return sum < num
}

pub fn deficient_in_range(start, end int) []int {
	mut are_deficient := []int{}
	for i in start .. end + 1 {
		if is_deficient(i) {
			are_deficient << i
		}
	}
	return are_deficient
}

pub fn get_deficiency(num int) int {
	facs := factors.get_proper_factors(num) or {
		panic(err)
	}
	sum := factors.factor_sum(facs)
	return num - sum
}
