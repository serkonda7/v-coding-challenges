/* Password Validator

Password validator is a program that validates passwords to match specific rules.

A valid password is the one that conforms to the following rules:
 - Minimum length is 6.
 - Maximum length is 14.
 - Should contain at least one number.
 - Should contain at least one uppercase and one lowercase letter.
 - Should contain at least one special character (such as &, +, @, $, #, %, etc.).
 - Should not contain spaces.

Write a program to checks if the user input is a valid password or not.
*/
module password_validator

import regex

pub fn is_valid(password string) bool {
	if password.len < 6 || password.len > 14 {
		return false
	}

	if password.count(' ') > 0 {
		return false
	}

	mut number_re, _, _ := regex.regex(r'\d')
	if number_re.find_all(password) == []int{} {
		return false
	}

	mut lower_re, _, _ := regex.regex(r'\a')
	if lower_re.find_all(password) == []int{} {
		return false
	}
	mut upper_re, _, _ := regex.regex(r'\A')
	if upper_re.find_all(password) == []int{} {
		return false
	}

	mut special_re, _, _ := regex.regex(r'[^A-Za-z0-9]')
	if special_re.find_all(password) == []int{} {
		return false
	}

	return true
}
