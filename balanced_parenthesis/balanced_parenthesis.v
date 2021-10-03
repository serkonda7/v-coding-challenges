module balanced_parenthesis

/*
Create a program that checks if in a given string expression all the parenthesis are balanced.
Also, take into account the "\" escape sequences:
*/

// is_balanced checks whether all parenthesis in a string are enclosed
pub fn is_balanced(str string) bool {
	mut open_paren := 0
	mut open_brackets := 0
	mut open_curly := 0
	for i := 0; i < str.len; i++ {
		c := str[i]
		match c {
			`\\` {
				i++
				continue
			}
			`(` {
				open_paren++
			}
			`[` {
				open_brackets++
			}
			`{` {
				open_curly++
			}
			`)` {
				open_paren--
			}
			`]` {
				open_brackets--
			}
			`}` {
				open_curly--
			}
			else {}
		}
		if open_paren < 0 || open_brackets < 0 || open_curly < 0 {
			return false
		}
	}
	return open_paren == 0 && open_brackets == 0 && open_curly == 0
}
