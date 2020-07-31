module ip_validator

fn test_valid_ips() {
	inp := ['127.0.0.1', '127.255.255.255']
	res := inp.map(is_valid(it))
	for r in res {
		assert r == true
	}
}

fn test_invalid_ips() {
	assert is_valid('257.0.0.1') == false
	assert is_valid('255a.0.0.1') == false
	assert is_valid('127.0.0.0.1') == false
}
