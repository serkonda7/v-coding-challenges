module sudoku_validator

fn test_valid_sudokus() {
	mut sudokus := [][][]int{}
	sudokus << [
		[3, 5, 2, 9, 1, 8, 6, 7, 4],
		[8, 9, 7, 2, 4, 6, 5, 1, 3],
		[6, 4, 1, 7, 5, 3, 2, 8, 9],
		[7, 8, 3, 5, 6, 9, 4, 2, 1],
		[9, 2, 6, 1, 3, 4, 7, 5, 8],
		[4, 1, 5, 8, 2, 7, 9, 3, 6],
		[1, 6, 4, 3, 7, 5, 8, 9, 2],
		[2, 7, 8, 4, 9, 1, 3, 6, 5],
		[5, 3, 9, 6, 8, 2, 1, 4, 7],
	]
	for s in sudokus {
		res := is_valid(s) or {
			eprintln(err.msg)
			false
		}
		assert res
	}
}

fn test_invalid_sudokus() {
	mut sudokus := [][][]int{}
	sudokus << [
		[3, 5, 2, 9, 1, 8, 6, 7, 4],
		[8, 9, 7, 2, 4, 6, 5, 1, 3],
		[6, 4, 1, 7, 5, 3, 2, 8, 9],
		[7, 8, 3, 5, 6, 9, 4, 2, 1],
		[9, 2, 6, 1, 3, 4, 7, 5, 8],
		[4, 1, 5, 8, 2, 7, 9, 3, 6],
		[8, 6, 4, 3, 7, 5, 8, 9, 2],
		[2, 7, 8, 4, 9, 1, 3, 6, 5],
		[5, 3, 9, 6, 8, 2, 1, 4, 7],
	]
	for s in sudokus {
		res := !is_valid(s) or {
			eprintln(err.msg)
			false
		}
		assert res
	}
}

struct ErrInput {
	sudoku  [][]int
	err_msg string
}

fn test_sudoku_errors() {
	inputs := [
		ErrInput{[[0], [1], [2], [3], [4], [5], [6]], 'Expected 9 rows, got 7'},
		ErrInput{[[0, 1, 2, 3, 4], [1], [2], [3], [4], [5], [6],
			[7], [8]], 'Expected 9 columns, but row 1 only has 5'},
		ErrInput{[[0, 1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3], [2],
			[3], [4], [5], [6], [7], [8]], 'Expected 9 columns, but row 2 only has 3'},
	]
	mut expexted_errors := inputs.len
	for inp in inputs {
		is_valid(inp.sudoku) or {
			expexted_errors--
			assert err.msg == inp.err_msg
		}
	}
	assert expexted_errors == 0
}
