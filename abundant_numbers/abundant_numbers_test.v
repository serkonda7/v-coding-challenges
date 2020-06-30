import abundant_numbers

fn test_is_abundant() {
	inp := [12, 42, 100]
	res := inp.map(abundant_numbers.is_abundant(it))
	for r in res {
		assert r == true
	}
}
