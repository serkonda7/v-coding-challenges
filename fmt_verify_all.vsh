#!/usr/local/bin/v run

root_dir := resource_abs_path('.')
v_files := walk_ext(root_dir, '.v')
mut errs := 0
for file in v_files {
	ret := system('v fmt -verify $file')
	if ret != 0 {
		errs++
	}
}
successfull := v_files.len - skipped - errs
println('Successfull\t| Errors\t| Total')
println('$successfull\t\t| $errs\t\t| $v_files.len')
if errs > 0 {
	exit(1)
}
