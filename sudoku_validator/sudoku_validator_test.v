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
		assert is_sudoku_valid(s)
	}
}

fn test_invalid_sudokus() {
	mut sudokus := [][][]int{}
	sudokus << [[0], [1], [2], [3], [4], [5], [6], [7]] // too few rows
	sudokus << [[0], [1], [2], [3], [4], [5], [6], [7], [8]] // too few columns
	// double eight, first col
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
		assert !is_sudoku_valid(s)
	}
}
