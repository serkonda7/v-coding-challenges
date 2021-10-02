module sudoku_validator

const target_sum = 45

pub fn is_sudoku_valid(sudoku_rows [][]int) bool {
	if sudoku_rows.len != 9 {
		return false
	}
	for row in sudoku_rows {
		if row.len != 9 {
			return false
		}
	}
	mut row_sums := []int{len: 9}
	mut col_sums := []int{len: 9}
	mut square_sums := []int{len: 9}
	for i, row in sudoku_rows {
		for j, val in row {
			row_sums[i] += val
			col_sums[j] += val
			sq_idx := (i / 3) + ((j / 3) * 3)
			square_sums[sq_idx] += val
		}
	}
	return row_sums.all(it == 45) && col_sums.all(it == 45) && square_sums.all(it == 45)
}
