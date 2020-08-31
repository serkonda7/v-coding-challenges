module valid_binary_string

fn test_valid_strings() {
	inputs := ['101011', '000', '111']
	for inp in inputs {
		assert is_binary_string(inp) == true
	}
}

fn test_invalid_strings() {
	inputs := ['Abc010', '', ' ', 'hello', '123']
	for inp in inputs {
		assert is_binary_string(inp) == false
	}
}
