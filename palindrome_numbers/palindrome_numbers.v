/*
Palindrome Numbers

Palindromic number is a number that is the same when written forwards or backwards.

Create a program that takes a number as input and return whether the number is palindromic, or not.
*/
module palindrome_numbers

pub fn is_palindrome(num int) bool {
	return num.str() == num.str().reverse()
}
