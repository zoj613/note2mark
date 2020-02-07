.PHONY: markdown notebook 

.DEFAULT: help

# extensions
nb_ext := .ipynb
md_ext := .md

# custom function for converting markdown/notebook files from one format to another
define to_markdown
	notedown $(1) --to markdown --strip > $(patsubst %.ipynb, %.md, $(1))
endef

define to_notebook
	notedown $(1) --to notebook --strip > $(patsubst *.md, *.ipynb, $(1))
endef


help:
	@echo "make markdown"
	@echo "       Convert .ipynb file/directory to markdown format."
	@echo "		  e.g. make markdown path=<path to file/dir>"
	@echo "       run tests using pytest in verbose mode."
	@echo "make notebook"
	@echo "       Convert .md file/directory to notebook format."
	@echo "		  e.g. make notebook path=<path to file/dir>"

# commands for converting a ipynb to markdown
markdown: $(path)
# if there is not suffix in path treat it as a directory
ifeq ($(suffix $(path)),)
	$(foreach f, $(wildcard $(path)**.ipynb), $(call to_markdown, $(f));)
# else treat it as a file and convert only if extension is .ipynb
else ifeq ($(suffix $(path)), $(nb_ext))
	$(call to_markdown, $(path))
endif

notebook: $(path)
# if there is not suffix in path treat it as a directory
ifeq ($(suffix $(path)),)
	$(foreach f, $(wildcard $(path)**.ipynb), $(call to_notebook, $(f));)
# else treat it as a file and convert only if extension is .md
else ifeq ($(suffix $(path)), $(md_ext))
		$(call to_notebook, $(path))
endif