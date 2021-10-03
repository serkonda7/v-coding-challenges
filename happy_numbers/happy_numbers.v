module happy_numbers

/*
https://en.wikipedia.org/wiki/Happy_number

If the repeated sum of squares of the digits of a number is equal to 1, it is considered to be happy.
If the sum of squares of digits reaches 4, 1 can never be reached thus making the number unhappy or sad.

Tasks:
  - (Easy) Write a program to verify whether a given number is happy or not.
  - (Medium) Write a program to find all the happy numbers in a range.
  - (Hard) Given a number, write a program to verify whether it's happy or not and to display every sum of squares operation performed till the result is obtained.
*/

// is_happy checks whether a numbers repeated sum of squares of the digits is equal to 1
pub fn is_happy(num int) bool {
	res, _ := is_happy_with_optional_steps(num, false)
	return res
}

// happy_in_range returns all happy numbers between ´min´ and ´max´ (exclusive)
pub fn happy_in_range(min int, max int) []int {
	mut are_happy := []int{}
	for i in min .. max {
		if is_happy(i) {
			are_happy << i
		}
	}
	return are_happy
}

// square_steps returns whether a number is happy and an array of the operations performed
pub fn square_steps(num int) (bool, []string) {
	return is_happy_with_optional_steps(num, true)
}

fn is_happy_with_optional_steps(num int, with_steps bool) (bool, []string) {
	if num <= 0 {
		return false, []string{}
	}
	mut num2 := num
	mut steps := []string{}
	for {
		if num2 == 1 || num2 == 4 {
			break
		}
		mut sum := 0
		mut squares := []string{}
		for {
			if num2 <= 0 {
				break
			}
			rem := num2 % 10
			sum += (rem * rem)
			num2 = num2 / 10
			if with_steps {
				squares << '$rem * $rem'
			}
		}
		if with_steps {
			sqr_str := squares.reverse().join(' + ')
			steps << '$sqr_str = $sum'
		}
		num2 = sum
	}
	return num2 == 1, steps
}
