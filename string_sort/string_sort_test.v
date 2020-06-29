import string_sort

fn test_plain_text() {
	inp := ['challenge', 's p a c e']
	exp := ['aceeghlln', 'aceps']
	res := inp.map(string_sort.sort(it))
	assert res == exp
}

fn test_number_precedence() {
	inp := 'happy42'
	exp := '24ahppy'
	res := string_sort.sort(inp)
	assert res == exp
}

fn test_special_precedence() {
	inp := [r'$tar3', 'c_!e']
	exp := [r'$3art', '!_ce']
	res := inp.map(string_sort.sort(it))
	assert res == exp
}
