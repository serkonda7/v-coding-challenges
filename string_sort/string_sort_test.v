module string_sort

fn test_plain_text() {
	unsorted := ['challenge', 's p a c e', 'smallCAPS']
	sorted := ['aceeghlln', 'aceps', 'ACPSallms']
	for i, str in unsorted {
		exp := sorted[i]
		assert sort(str) == exp
	}
}

fn test_number_precedence() {
	input := 'happy42'
	exp := '24ahppy'
	assert sort(input) == exp
}

fn test_special_precedence() {
	unsorted := [r'$tar3', 'c_!e']
	sorted := [r'$3art', '!_ce']
	for i, str in unsorted {
		exp := sorted[i]
		assert sort(str) == exp
	}
}

fn test_empty_strings() {
	unsorted := ['  ', '']
	sorted := ['', '']
	for i, str in unsorted {
		exp := sorted[i]
		assert sort(str) == exp
	}
}
