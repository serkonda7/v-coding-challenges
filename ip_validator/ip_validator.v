module ip_validator

/*
Given a string as input, create a program to evaluate whether or not it is a valid IPv4 address.

A valid IP address should be in the form of: a.b.c.d where a, b, c and d are integer values ranging from 0 to 255 inclusive.

To keep things simple, you do not need to consider subnets or special octet values.
*/
import regex

// is_valid_ipv4 checks whether a IP adress is in valid IPv4 format
pub fn is_valid_ipv4(ip string) bool {
	nums := ip.split('.')
	if nums.len != 4 {
		return false
	}
	mut no_digit_re := regex.regex_opt(r'\D') or { panic(err) }
	for n in nums {
		_, re_match := no_digit_re.find(n)
		if re_match != -1 {
			return false
		}
		if n.int() < 0 || n.int() > 255 {
			return false
		}
	}
	return true
}
