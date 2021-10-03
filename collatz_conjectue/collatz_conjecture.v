module collatz_conjecture

/*
The Collatz conjecture (also known as the Ulam conjecture or the Syracuse problem) is an unsolved mathematical problem, which is very easy to formulate:

1. Take any natural number
2. If it's even, half it, otherwise triple it and add one
3. Repeat step 2. until you reach 4, 2, 1 sequence
4. You will ALWAYS reach 1, eventually.

That last sequence: 4, 2, 1 is an infinitely repeating loop. The formulated conjecture is
that for any x the sequence will always reach 4, 2, 1 ultimately.

While the problem cannot be proved, the assignment is to write a code that will produce
and print out the whole sequence for an input number.

Both recursive and iterative approaches count.
Bonus points for printing out how many iterations it took for x to converge to 1.
*/

// get_sequence_iterative returns the sequence of calculations for a given number and the number of steps.
pub fn get_sequence_iterative(num int) ?([]string, int) {
	if num <= 0 {
		return error('Input has to be an natural number')
	}
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
		if n == 1 {
			break
		}
	}
	return sequence, steps
}

// get_sequence_recursive returns the sequence of calculations for a given number and the number of steps.
// This approach uses recursion.
pub fn get_sequence_recursive(num int) ?([]string, int) {
	if num <= 0 {
		return error('Input has to be an natural number')
	} else if num == 1 {
		return []string{}, 0
	}
	mut res := 0
	mut sequence := ['']
	if num % 2 == 0 {
		res = num / 2
		sequence = ['$num / 2 = $res']
	} else {
		res = num * 3 + 1
		sequence = ['$num * 3 + 1 = $res']
	}
	seq, steps := get_sequence_recursive(res) ?
	sequence << seq
	return sequence, steps + 1
}
