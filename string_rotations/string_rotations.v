/*
String Rotations

Create a function that accepts a string argument and returns an array of strings, which are shifted versions of the argument string.

The original string should be included in the output array. The order matters; each element of the output array should be the shifted version of the previous element.
The output array should have the same length as the input string.
The function should return an empty array when a zero-length String is provided as the argument.
*/
module string_rotations

pub fn rotated_string(str string) []string {
	len := str.len
	mut rot_str := []string{len: len}
	for i in 0 .. len {
		last_str := if i > 0 { rot_str[i - 1] } else { str }
		s := last_str[1..len] + last_str[0].ascii_str()
		rot_str[i] = s
	}
	return rot_str
}
