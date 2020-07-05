module valid_binary_string

fn test_valid_strings() {
	inp := ['101011', '000', '111']
	res := inp.map(is_binary_string(it))
	for r in res {
		assert r == true
	}
}

fn test_invalid_strings() {
	inp := ['Abc010', '', ' ', 'hello', '123']
	res := inp.map(is_binary_string(it))
	for r in res {
		assert r == false
	}
}
