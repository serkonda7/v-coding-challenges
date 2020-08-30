module balanced_parenthesis

fn test_balanced() {
	inputs := ['', '(test)', '()(())', '{val()id}', 'a[]b', '([{)]}']
	for inp in inputs {
		res := is_balanced(inp)
		assert res == true
	}
}

fn test_unbalanced() {
	inputs := ['(no()', '(123(456)(7))(', '(', ')', ')(', '[}', '([)[']
	for inp in inputs {
		res := is_balanced(inp)
		assert res == false
	}
}

fn test_with_escape() {
	inputs := ['(nope\\)', '(v\\(al)', '{\\]}[(])']
	expected := [false, true, true]
	for i, inp in inputs {
		res := is_balanced(inp)
		assert res == expected[i]
	}
}
