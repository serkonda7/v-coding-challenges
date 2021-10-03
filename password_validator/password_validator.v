module password_validator

/*
Password validator is a program that validates passwords to match specific rules.

Write a program to checks if the user input is a valid password or not.
*/
import regex

// Rule definitions
const (
	min_len         = 6
	max_len         = 14
	require_num     = true
	require_lower   = true
	require_upper   = true
	require_special = true
	allow_spaces    = false
)

// is_valid checks whether a password conforms with the defined rules
pub fn is_valid(password string) bool {
	if password.len < password_validator.min_len || password.len > password_validator.max_len {
		return false
	}
	if !password_validator.allow_spaces && password.count(' ') > 0 {
		return false
	}
	if password_validator.require_num {
		mut number_re := regex.regex_opt(r'\d') or { panic(err) }
		if number_re.find_all(password).len == 0 {
			return false
		}
	}
	if password_validator.require_lower {
		mut lower_re := regex.regex_opt(r'\a') or { panic(err) }
		if lower_re.find_all(password).len == 0 {
			return false
		}
	}
	if password_validator.require_upper {
		mut upper_re := regex.regex_opt(r'\A') or { panic(err) }
		if upper_re.find_all(password).len == 0 {
			return false
		}
	}
	if password_validator.require_special {
		mut special_re := regex.regex_opt(r'[^A-Za-z0-9]') or { panic(err) }
		if special_re.find_all(password).len == 0 {
			return false
		}
	}
	return true
}
