pull:
	mr -j4 update

push:
	mr push

clean-elc:
	find -type f -iname "*.elc" -exec rm {} \;
