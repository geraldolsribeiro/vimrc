### ----------------------------------------------------------------------
### Copyright (C) 2017-2020 Geraldo Ribeiro <geraldo@intmain.io>
### ----------------------------------------------------------------------

DOCMD_OPTIONS+=INTMAIN_DOCMD_DETAILS=false

all: doc

doc:
	$(DOCMD_OPTIONS) intmain_docmd vim vimrc README.md

update:
	vim +VundleUpdate +qall

install:
	vim +BundleInstall +qall
