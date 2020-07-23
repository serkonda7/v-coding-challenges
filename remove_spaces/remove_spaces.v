/* Remove Spaces from a String

Given a string as input, output it without spaces.
*/
module remove_spaces

pub fn remove_whitespace(str string) string {
	s := str.replace(' ', '')
	return s
}
