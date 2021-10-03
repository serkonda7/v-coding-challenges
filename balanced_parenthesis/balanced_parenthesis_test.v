module balanced_parenthesis

fn test_balanced() {
	inputs := ['', 'no parens here', '(test)', '()(())', '{val()id}', 'a[]b', '([{)]}']
	for inp in inputs {
		assert is_balanced(inp)
	}
}

fn test_unbalanced() {
	inputs := ['(no()', '(123(456)(7))(', '(', ')', ')(', '[}', '([)[']
	for inp in inputs {
		assert !is_balanced(inp)
	}
}

fn test_with_escape() {
	inputs := [r'(nope\)', r'(v\(al)', r'{\]}[(])', r'\)(\))']
	expected := [false, true, true, true]
	for i, inp in inputs {
		res := is_balanced(inp)
		exp := expected[i]
		assert res == exp
	}
}
