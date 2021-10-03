module remove_spaces

// remove_spaces returns a input string with all spaces removed
pub fn remove_spaces(str string) string {
	s := str.replace(' ', '')
	return s
}
