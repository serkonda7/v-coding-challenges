module factors

fn test_positive_num_factors() {
	numbers := [1, 12, 15, 945]
	factors := [
		[1],
		[1, 2, 3, 4, 6, 12],
		[1, 3, 5, 15],
		[1, 3, 5, 7, 9, 15, 21, 27, 35, 45, 63, 105, 135, 189, 315, 945],
	]
	for i, num in numbers {
		res := get_factors(num) or {
			panic(err)
		}
		exp := factors[i]
		assert res == exp
	}
}

fn test_factors_of_zero() {
	get_factors(0) or {
		assert err == 'Cannot get factors of `0`'
	}
}

fn test_negative_num_factors() {
	numbers := [-1, -8, -15]
	factors := [
		[-1, 1],
		[-8, -4, -2, -1, 1, 2, 4, 8],
		[-15, -5, -3, -1, 1, 3, 5, 15],
	]
	for i, num in numbers {
		mut res := get_factors(num) or {
			panic(err)
		}
		res.sort()
		exp := factors[i]
		assert res == exp
	}
}

fn test_factor_sum() {
	// Positive
	pos_factors := [1, 2, 3, 4, 6]
	pos_sum := factor_sum(pos_factors)
	assert pos_sum == 16
	// With negative
	all_factors := [-4, -2, -1, 1, 2, 4]
	all_sum := factor_sum(all_factors)
	assert all_sum == 0
}
