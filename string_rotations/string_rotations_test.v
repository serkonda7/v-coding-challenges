module string_rotations

fn test_rotated_string() {
	inp := ['Hello', '', '  ', 'aBc1']
	exp := [
		['elloH', 'lloHe', 'loHel', 'oHell', 'Hello'],
		[], ['  ', '  '],
		['Bc1a', 'c1aB', '1aBc', 'aBc1'],
	]
	res := inp.map(rotated_string(it))
	assert res == exp
}
