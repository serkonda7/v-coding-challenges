/* Abundant Numbers

If the sum of factors of a number is greater than that number, it is considered to be abundant.

Tasks:
  - (Easy) Verify whether a given number is abundant or not.
  - (Medium) Find all the abundant numbers in a range.
  - (Hard) Given a number, display its factors, their sum and then verify whether it's abundant or not.
*/
module abundant_numbers

pub fn is_abundant(num int) bool {
	mut factors := []int{}
	max_factor := num / 2
	for i in 1..max_factor + 1 {
		if num % i == 0 {
			factors << i
		}
	}
	mut sum := 0
	for f in factors {
		sum += f
	}
	if sum > num {
		return true
	}
	return false
}
