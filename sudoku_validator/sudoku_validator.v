module sudoku_validator

/*
A solved sudoku puzzle is a matrix of typically 9*9 in which every row, every column
and every block contains every number from 1 to 9 exactly once.

> A block is a 3*3 area in the sudoku that you get by splitting it up into 9 even squares.

Create an algorithm that checks any solved sudoku's validity.
Bonus: Change the code to mark all mistakes in the sudoku puzzle.
*/

// is_valid returns whether a solved sudoku matrix is correct
// and a map of all wrong fields per row
pub fn is_valid(sudoku_rows [][]int) ?(bool, map[int][]int) {
	if sudoku_rows.len != 9 {
		return error('Expected 9 rows, got $sudoku_rows.len')
	}
	for i, row in sudoku_rows {
		if row.len != 9 {
			return error('Expected 9 columns, but row ${i + 1} only has $row.len')
		}
	}

	mut cols := [][]int{len: 9}
	for row in sudoku_rows {
		for j, val in row {
			if val < 1 || val > 9 {
				return false, map[int][]int{}
			}
			cols[j] << val
		}
	}

	mut wrong_fields := map[int][]int{}
	for r, row in sudoku_rows {
		for n in 1 .. 10 {
			idx1 := row.index(n)
			idx2 := 8 - row.reverse().index(n)
			if idx1 >= 0 && idx1 != idx2 {
				wrong_fields[r] << idx1
				wrong_fields[r] << idx2
			}
		}
	}
	for c, col in cols {
		for n in 1 .. 10 {
			idx1 := col.index(n)
			idx2 := 8 - col.reverse().index(n)
			if idx1 >= 0 && idx1 != idx2 {
				if c !in wrong_fields[idx1] {
					wrong_fields[idx1] << c
				}
				if c !in wrong_fields[idx2] {
					wrong_fields[idx2] << c
				}
			}
		}
	}

	return wrong_fields.keys().len == 0, wrong_fields
}
