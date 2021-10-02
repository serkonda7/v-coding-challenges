module sudoku_validator

const target_sum = 45

pub fn is_valid(sudokus [][]int) ?bool {
	if sudokus.len != 9 {
		return error('Expected 9 rows, got $sudokus.len')
	}
	for i, row in sudokus {
		if row.len != 9 {
			return error('Expected 9 columns, but row ${i + 1} only has $row.len')
		}
	}
	mut row_sums := []int{len: 9}
	mut col_sums := []int{len: 9}
	mut square_sums := []int{len: 9}
	for i, row in sudokus {
		for j, val in row {
			row_sums[i] += val
			col_sums[j] += val
			sq_idx := (i / 3) + ((j / 3) * 3)
			square_sums[sq_idx] += val
		}
	}
	return row_sums.all(it == 45) && col_sums.all(it == 45) && square_sums.all(it == 45)
}
