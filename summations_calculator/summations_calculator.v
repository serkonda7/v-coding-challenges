module summations_calculator

/*
Create a program that takes 3 inputs, a lower bound, an upper bound and the expression. Calculate the sum of that range based on the given expression and output the result.
*/

const expr_funcs = {
	'+': add
	'-': sub
	'*': mult
	'x': mult
	'/': div
	'%': modulo
}

// get_summation returns the sum using the given expression for the range from ´min´ to ´max´ (inclusive)
pub fn get_summation(min int, max int, expression string) ?int {
	expr := expression.replace(' ', '')
	expr_type := expr[0].ascii_str()
	if expr_type !in summations_calculator.expr_funcs {
		return error('Unknown type for expression: `$expression`')
	}
	expr_num := expr[1..].int()
	func := summations_calculator.expr_funcs[expr_type]
	mut sum := 0
	for i in min .. max + 1 {
		step := func(i, expr_num)
		sum += step
	}
	return sum
}

// Mathematic helper functions
fn add(a int, b int) int {
	return a + b
}

fn sub(a int, b int) int {
	return a - b
}

fn mult(a int, b int) int {
	return a * b
}

fn div(a int, b int) int {
	return a / b
}

fn modulo(a int, b int) int {
	return a % b
}
