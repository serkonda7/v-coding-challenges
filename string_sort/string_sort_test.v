module string_sort

fn test_plain_text() {
	inp := ['challenge', 's p a c e', 'smallCAPS']
	exp := ['aceeghlln', 'aceps', 'ACPSallms']
	res := inp.map(sort(it))
	assert res == exp
}

fn test_number_precedence() {
	inp := 'happy42'
	exp := '24ahppy'
	res := sort(inp)
	assert res == exp
}

fn test_special_precedence() {
	inp := [r'$tar3', 'c_!e']
	exp := [r'$3art', '!_ce']
	res := inp.map(sort(it))
	assert res == exp
}
