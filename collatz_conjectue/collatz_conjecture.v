/*
Collatz Conjecture

The Collatz conjecture (also known as the Ulam conjecture or the Syracuse problem) is an unsolved mathematical problem, which is very easy to formulate:

1. Take any natural number
2. If it's even, half it, otherwise triple it and add one
3. Repeat step 2. until you reach 4, 2, 1 sequence
4. You will ALWAYS reach 1, eventually.

That last sequence: 4, 2, 1 is an infinitely repeating loop. The formulated conjecture is that for any x the sequence will always reach 4, 2, 1 ultimately.

While the problem cannot be proved, the assignment is to write a code that will produce and print out the whole sequence for an input number.


Both recursive and iterative approaches count. Bonus points for printing out how many iterations it took for x to converge to 1.
*/
module collatz_conjecture

pub fn get_sequence_iterative(num int) ([]string, int) {
	mut got_one := false
	mut n := num
	mut sequence := []string{}
	mut steps := 0
	for {
		if n % 2 == 0 {
			res := n / 2
			sequence << '$n / 2 = $res'
			n = res
		} else {
			res := n * 3 + 1
			sequence << '$n * 3 + 1 = $res'
			n = res
		}
		steps++
		if got_one {
			break
		}
		if n == 1 {
			got_one = true
		}
	}
	return sequence, steps
}

pub fn get_sequence_recursive(num int) int {
	if num == 1 {
		// sequence << '1 * 3 + 1 = 4'
		return 1
	}
	mut res := 0
	if num % 2 == 0 {
		res = num / 2
		// sequence << '$num / 2 = $res'
	} else {
		res = num * 3 + 1
		// sequence << '$num * 3 + 1 = $res'
	}
	return 1 + get_sequence_recursive(res)
}
