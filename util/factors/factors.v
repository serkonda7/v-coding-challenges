module factors

import math

// get_proper_factors returns all factors of a number except the number itself
pub fn get_proper_factors(num int) ?[]int {
	if num == 0 {
		return error('Cannot get factors of `0`')
	}
	is_negative := num < 0
	abs_num := int(math.abs(num))
	mut factors := []int{}
	max_factor := (abs_num / 2) + 1
	if max_factor == 1 {
		return []
	}
	for i in 1 .. max_factor {
		if num % i == 0 {
			factors << i
			if is_negative {
				factors << -i
			}
		}
	}
	return factors
}

// get_factors returns all factors of a number including the number itself
pub fn get_factors(num int) ?[]int {
	mut factors := get_proper_factors(num) or { return err }
	is_negative := num < 0
	factors << num
	if is_negative {
		factors << -num
	}
	return factors
}

// factor_sum returns the sum of an array of factors
pub fn factor_sum(factors []int) int {
	mut sum := 0
	for f in factors {
		sum += f
	}
	return sum
}
