#!/bin/bash
#set -x
GREEN='\033[0;32m'
NOCOLOR='\033[0m'

create_temp_dir() {
	mkdir -p temp
	cd temp
}

clone_from_github() {
	local repo=$@

	git clone https://github.com/ansible-collections/$repo
	cd $repo
}

push_to_gitlab() {
	local repo=$@

	git push http://yuvalba1:pass@corpgit/ansible-collections/$repo -f
}

before_remove_temp_dir() {
	rm -rf temp
}

remove_temp_dir() {
	cd ../../
	rm -rf temp
}

message_out() {
	local repo=$@

	echo -e "${GREEN} $repo successfully transferred !${NOCOLOR} "
}

main() {

# add path to requirements.txt file that include list of ansible collections from github:
	while IFS=$' \t\r\n' read -r repo; do
		before_remove_temp_dir
		create_temp_dir
		clone_from_github $repo
		push_to_gitlab $repo
		remove_temp_dir
		message_out $repo
	done <$@
}
main $@
