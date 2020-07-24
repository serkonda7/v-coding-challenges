module balanced_parenthesis

fn test_balanced_strings() {
	inputs := ['(test)', '()(())', '(val()id)', 'a()b', '']
	for inp in inputs {
		assert is_balanced(inp) == true
	}
}

fn test_unbalanced_strings() {
	inputs := ['(no()', '(123(456)(7))(', '(', ')', ')(']
	for inp in inputs {
		assert is_balanced(inp) == false
	}
}

// fn test_with_escape() {
// 	inp := [r'(nope\)', r'(v\(al)',]
// 	exp := [false, true,]
// 	res := inp.map(is_balanced(it))
// 	assert res == exp
// }
