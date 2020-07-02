module util

pub fn get_factors(num int) []int {
	mut factors := []int{}
	max_factor := num / 2  // The number itself is not considered
	for i in 1..max_factor + 1 {
		if num % i == 0 {
			factors << i
		}
	}

	return factors
}

pub fn factor_sum(factors []int) int {
	mut sum := 0
	for f in factors {
		sum += f
	}

	return sum
}
