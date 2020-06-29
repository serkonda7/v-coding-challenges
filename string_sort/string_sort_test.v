import string_sort

fn test_plain_text() {
	inp := 'challenge'
	exp := 'aceeghlln'
	res := string_sort.sort(inp)
	assert res == exp
}

fn test_number_precedence() {
	inp := 'happy42'
	exp := '24ahppy'
	res := string_sort.sort(inp)
	assert res == exp
}

fn test_special_precedence() {
	inp := r'$tar3'
	exp := r'$3art'
	res := string_sort.sort(inp)
	assert res == exp
}
