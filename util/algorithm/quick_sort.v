module algorithm

// quick_sort sorts an array of bytes
pub fn quick_sort(mut chars []byte, l int, r int) {
	if l >= r {
		return
	}
	mut piv := l
	for i in l + 1 .. r + 1 {
		if chars[i] < chars[l] {
			piv++
			chars[i], chars[piv] = chars[piv], chars[i]
		}
	}
	chars[l], chars[piv] = chars[piv], chars[l]
	quick_sort(mut chars, l, piv - 1)
	quick_sort(mut chars, piv + 1, r)
}
