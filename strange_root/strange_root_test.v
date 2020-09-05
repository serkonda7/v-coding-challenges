module strange_root

fn test_has_strange_root() {
	strange_root_nums := [11]
	for num in strange_root_nums {
		res := has_strange_root(num)
		assert res == true
	}
	normal_nums := [24]
	for num in normal_nums {
		res := has_strange_root(num)
		assert res == false
	}
}
