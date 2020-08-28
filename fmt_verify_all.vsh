#!/usr/local/bin/v run

root_dir := resource_abs_path('.')
files := ls(root_dir) or { panic(err) }
dirs := files.filter(is_dir(it) && !it.starts_with('.'))
mut errs := 0
for dir in dirs {
	subfiles := ls(dir) or { panic(err) }
	for file in subfiles {
		if !file.ends_with('.v') {
			continue
		}
		ret := system('v fmt -verify $root_dir/$dir/$file')
		if ret != 0 {
			errs++
		}
	}
}
if errs > 0 {
	println('Failed with $errs unformatted files')
	exit(1)
}
