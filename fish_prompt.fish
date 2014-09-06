function fish_prompt --description 'Write out the prompt'

	set -l last_status $status

	if not set -q __fish_prompt_normal
	set -g __fish_prompt_normal (set_color normal)
	end

	# PWD
	set_color cyan
	printf (date "+$c2%H$c0:$c2%M$c0:$c2%S ")

	set_color -b normal $fish_color_cwd
	echo -n (prompt_pwd)
	set_color brown

	printf '%s ' (__fish_git_prompt)

	if not test $last_status -eq 0
	set_color $fish_color_error
	end

	echo -n '$ '

	# Line 2
	echo

	if test $VIRTUAL_ENV
		printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
	end

	printf '↪ '

end
