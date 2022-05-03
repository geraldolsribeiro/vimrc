### ----------------------------------------------------------------------
### Copyright (C) 2017-2020 Geraldo Ribeiro <geraldo@intmain.io>
### ----------------------------------------------------------------------

.PHONY: doc

DOCMD_OPTIONS+=INTMAIN_DOCMD_DETAILS=false

all: doc

doc:
	$(DOCMD_OPTIONS) intmain_docmd vim vimrc README.md

update:
	echo vim +VundleUpdate +qall
	vim +PlugUpdate +qall

install:
	echo vim +BundleInstall +qall
	vim +PlugInstall +qall

