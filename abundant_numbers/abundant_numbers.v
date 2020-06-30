/* Abundant Numbers
    https://en.wikipedia.org/wiki/Abundant_number

If the sum of factors of a number is greater than that number, it is considered to be abundant.

Tasks:
  - (Easy) Verify whether a given number is abundant or not.
  - (Medium) Find all the abundant numbers in a range.
  - (Hard) Given a number, display its factors, their sum and then verify whether it's abundant or not.
*/
module abundant_numbers

pub fn is_abundant(num int) bool {
	factors := get_factors(num)
	sum := factor_sum(factors)
	if sum > num {
		return true
	}
	return false
}

pub fn abundant_in_range(start, end int) []int {
	mut are_abundant := []int{}
	for i in start..end+1 {
		if is_abundant(i) {
			are_abundant << i
		}
	}

	return are_abundant
}

pub fn get_abundancy(num int) int {
	sum := factor_sum(get_factors(num))
	return sum - num  // Negative for non-abundant numbers
}

fn get_factors(num int) []int {
	mut factors := []int{}
	max_factor := num / 2  // The number itself is not counted
	for i in 1..max_factor + 1 {
		if num % i == 0 {
			factors << i
		}
	}

	return factors
}

fn factor_sum(factors []int) int {
	mut sum := 0
	for f in factors {
		sum += f
	}

	return sum
}
