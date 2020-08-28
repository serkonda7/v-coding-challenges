module balanced_parenthesis

fn test_balanced_strings() {
	inp := ['(test)', '()(())', '(val()id)', 'a()b', '']
	res := inp.map(is_balanced(it))
	for r in res {
		assert r == true
	}
}

fn test_unbalanced_strings() {
	inp := ['(no()', '(123(456)(7))(', '(', ')', ')(']
	res := inp.map(is_balanced(it))
	for r in res {
		assert r == false
	}
}

fn test_with_escape() {
	inp := ['(nope\\)', '(v\\(al)']
	exp := [false, true]
	res := inp.map(is_balanced(it))
	assert res == exp
}
