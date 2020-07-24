/* Balanced Parenthesis

Create a program that checks if in a given string expression all the parenthesis are balanced.

Also, take into account the "\" escape sequences:
*/
module balanced_parenthesis

pub fn is_balanced(str string) bool {
	mut open_paren := 0
	for s in str {
		// if s.str() == r'\' {
		// 	continue
		// }
		if s == `(` {
			open_paren++
		} else if s == `)` {
			if open_paren == -1 {
				return false
			}
			open_paren--
		}
	}
	return open_paren == 0
}
