pull:
	git fetch --prune
	git pull --rebase --recurse-submodules origin master
	git submodule update --init

push:
	git push origin master

update-modules:
	~/bin/git/git-merge-submodules.sh
	git commit -am "Update deps"
