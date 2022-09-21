### ----------------------------------------------------------------------
### Copyright (C) 2017-2022 Geraldo Ribeiro <geraldo@intmain.io>
### ----------------------------------------------------------------------

.PHONY: doc

DOCMD_OPTIONS+=INTMAIN_DOCMD_DETAILS=false

all: doc

doc:
	$(DOCMD_OPTIONS) intmain_docmd vim vimrc README.md

update:
	vim +PlugUpdate +qall

install:
	vim +PlugInstall +qall

