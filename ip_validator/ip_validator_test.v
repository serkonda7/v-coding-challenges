module ip_validator

fn test_valid_ips() {
	ips := ['127.0.0.1', '127.255.255.255']
	for ip in ips {
		assert is_valid(ip) == true
	}
}

fn test_invalid_ips() {
	ips := ['257.0.0.1', '255a.0.0.1', '127.0.0.0.1']
	for ip in ips {
		assert is_valid(ip) == false
	}
}
