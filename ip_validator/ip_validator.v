/* Is That an IP Address?

Given a string as input, create a program to evaluate whether or not it is a valid IPv4 address.

A valid IP address should be in the form of: a.b.c.d where a, b, c and d are integer values ranging from 0 to 255 inclusive.

To keep things simple, you do not need to consider subnets or special octet values.
*/
module ip_validator

import regex

pub fn is_valid(ip string) bool {
	nums := ip.split('.')
	if nums.len != 4 {
		return false
	}
	mut no_digit_re, _, _ := regex.regex('\\D')
	for n in nums {
		_, re_match := no_digit_re.find(n)
		if re_match != 0{
			return false
		}
		if n.int() < 0 || n.int() > 255 {
			return false
		}
	}
	return true
}
