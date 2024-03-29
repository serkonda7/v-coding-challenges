module string_rotation

fn test_rotated_string() {
	inputs := ['Hello', '', '  ', 'aBc1']
	expected := [
		['elloH', 'lloHe', 'loHel', 'oHell', 'Hello'],
		[],
		['  ', '  '],
		['Bc1a', 'c1aB', '1aBc', 'aBc1'],
	]
	for i, inp in inputs {
		res := rotated_string(inp)
		exp := expected[i]
		assert res == exp
		assert res.len == inp.len
	}
}
