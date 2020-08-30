/*
Summations Calculator

Create a program that takes 3 inputs, a lower bound, an upper bound and the expression. Calculate the sum of that range based on the given expression and output the result.
*/
module summations_calculator

const (
	expr_funcs = {
		'+': add
		'-': sub
		'*': mult
		'x': mult
		'/': div
		'%': modulo
	}
)

pub fn get_summation(min, max int, expression string) ?int {
	expr_type := expression[0].str()
	if expr_type !in expr_funcs {
		return error('Unknown expression type: $expr_type')
	}
	expr_num := expression[1..].int()
	func := expr_funcs[expr_type]
	mut sum := 0
	// In the task the range is inclusive!
	for i in min .. max + 1 {
		step := func(i, expr_num)
		sum += step
	}
	return sum
}

// Mathematic helper functions
fn add(a, b int) int {
	return a + b
}

fn sub(a, b int) int {
	return a - b
}

fn mult(a, b int) int {
	return a * b
}

fn div(a, b int) int {
	return a / b
}

fn modulo(a, b int) int {
	return a % b
}
