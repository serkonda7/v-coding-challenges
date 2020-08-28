module factors

fn test_get_factors() {
	// Positive numbers
	pos_nums := [1, 12, 15, 945]
	pos_exp := [
		[1],
		[1, 2, 3, 4, 6, 12],
		[1, 3, 5, 15],
		[1, 3, 5, 7, 9, 15, 21, 27, 35, 45, 63, 105, 135, 189, 315, 945],
	]
	for i, num in pos_nums {
		res := get_factors(num) or {
			panic(err)
		}
		assert res == pos_exp[i]
	}
	// 0
	get_factors(0) or {
		assert err == 'Cannot get factors of `0`'
	}
	// Negative numbers
	neg_nums := [-1, -8, -15]
	neg_exp := [
		[-1, 1],
		[-8, -4, -2, -1, 1, 2, 4, 8],
		[-15, -5, -3, -1, 1, 3, 5, 15],
	]
	for i, num in neg_nums {
		mut res := get_factors(num) or {
			panic(err)
		}
		res.sort()
		assert res == neg_exp[i]
	}
}

fn test_factor_sum() {
	// Positive
	pos_factors := [1, 2, 3, 4, 6]
	assert factor_sum(pos_factors) == 16
	// With negative
	all_factors := [-4, -2, -1, 1, 2, 4]
	assert factor_sum(all_factors) == 0
}
