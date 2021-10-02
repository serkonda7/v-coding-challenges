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
		res, _ := is_valid(s) or { panic(err) }
		assert res
	}
}

struct InvalidInput {
	sudoku  [][]int
	indices map[int][]int
}

fn test_invalid_sudokus() {
	mut inputs := []InvalidInput{}
	inputs << InvalidInput{[
		[3, 5, 2, 9, 1, 8, 6, 7, 4],
		[8, 9, 7, 2, 4, 6, 5, 1, 3],
		[6, 4, 1, 7, 5, 3, 2, 8, 9],
		[7, 8, 3, 5, 6, 9, 4, 2, 1],
		[9, 2, 6, 1, 3, 4, 7, 5, 8],
		[4, 1, 5, 8, 2, 7, 9, 3, 6],
		[9, 6, 4, 3, 7, 5, 8, 9, 2],
		[2, 7, 8, 4, 9, 1, 3, 6, 5],
		[5, 3, 9, 6, 8, 2, 1, 4, 7],
	], {
		4: [0]
		6: [0, 7]
	}}
	for inp in inputs {
		res, indices := is_valid(inp.sudoku) or { panic(err) }
		assert !res
		assert indices == inp.indices
	}
}

fn test_sudoku_errors() {
	input_map := {
		'Expected 9 rows, got 7':                   [[0], [1],
			[2], [3], [4], [5], [6]]
		'Expected 9 columns, but row 1 only has 5': [[0, 1, 2, 3, 4],
			[1], [2], [3], [4], [5], [6], [7], [8]]
		'Expected 9 columns, but row 2 only has 3': [[0, 1, 2, 3, 4, 5, 6, 7, 8],
			[1, 2, 3], [2], [3], [4], [5], [6], [7], [8]]
	}
	mut expexted_errors := 3
	for msg, sudoku_rows in input_map {
		is_valid(sudoku_rows) or {
			expexted_errors--
			assert err.msg == msg
		}
	}
	assert expexted_errors == 0
}
