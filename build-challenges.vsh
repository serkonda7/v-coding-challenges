root := resource_abs_path('.') + '/'
chdir(root)
files := ls('.') or { panic(err) }
dirs := files.filter(!it.starts_with('.') && is_dir(it))
for dir in dirs {
	if dir == 'util' { continue }
	println(dir)
	file_path := '$dir/${dir}.v'
	ret := system('v -shared $file_path')
	if ret != 0 {
		println('failed')
		exit(1)
	}
	rm('$dir/${dir}.so')
}
