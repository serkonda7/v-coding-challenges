/* Happy Numbers https://en.wikipedia.org/wiki/Happy_number

If the repeated sum of squares of the digits of a number is equal to 1, it is considered to be happy.

If the sum of squares of digits reaches 4, 1 can never be reached thus making the number unhappy or sad.

Tasks:
  - (Easy) Write a program to verify whether a given number is happy or not.
  - (Medium) Write a program to find all the happy numbers in a range.
  - (Hard) Given a number, write a program to verify whether it's happy or not and to display every sum of squares operation performed till the result is obtained.
*/
module happy_numbers

pub fn is_happy(num int) bool {
	mut num2 := num
	for {
		if num2 == 1 {
			return true
		}
		if num2 == 4 {
			return false
		}
		mut rem := 0
		mut sum := 0
		for {
			if num2 <= 0 {
				break
			}
			rem = num2 % 10
			sum += (rem * rem)
			num2 = num2/10
		}
		num2 = sum
	}
}

pub fn happy_in_range(start, end int) []int {
	mut are_happy := []int{}
	for i in start..end+1 {
		if is_happy(i) {
			are_happy << i
		}
	}

	return are_happy
}

//TODO: square steps
