module valid_binary_string

/*
A valid binary string is a string that contains only 1's and 0's.

Write a program to check if the user input is a valid binary string or not.
*/

// is_binary_string checks whether a string consists only of 0's and 1's
pub fn is_binary_string(str string) bool {
	if str.len == 0 {
		return false
	}
	zeros := str.count('0')
	ones := str.count('1')
	return zeros + ones == str.len
}
