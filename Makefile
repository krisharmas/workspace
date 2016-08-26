# Makefile to create symlinks for dotfiles/directories in home directory

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
DIR = "mac"
else
DIR = "linux"
endif

DOTFILES = $(shell find dotfiles/$(DIR) -maxdepth 1 | tail -n +2)
GITHOOKS = $(shell ls githooks/[a-z]*)
VIM = $(shell find  vim -maxdepth 1 | tail -n +2)
BIN = $(shell ls bin/*)
FILES = $(DOTFILES) $(VIM)

all: symlink githooks

symlink:
	for file in $(FILES) ; do \
		link="$(HOME)/`basename $$file`" ; \
		if [ -e $$link ] ; \
		then \
			mv $$link $$link.bk ; \
		fi ; \
		ln -s $(PWD)/$$file $$link ; \
	done ; \
	mkdir -p $(HOME)/.local/bin ; \
	for file in $(BIN) ; do \
		link="$(HOME)/.local/bin/`basename $$file`" ; \
		if [ -e $$link ]; \
		then \
			mv $$link $$link.bk ; \
		fi ; \
		ln -s $(PWD)/$$file $$link ; \
	done

githooks:
	mkdir -p $(HOME)/.git_templates/hooks ; \
	for hook in $(GITHOOKS) ; do \
		link="$(HOME)/.git_templates/hooks/`basename $$hook`" ; \
		if [ -e $$link ] ; \
		then \
			rm $$link ; \
		fi ; \
		ln -s $(PWD)/$$hook $$link ; \
	done

clean:
	for file in $(FILES) ; do \
		link_bk="$(HOME)/`basename $$file`.bk" ; \
		if [ -e $$link_bk ] ; \
		then \
			rm $$link_bk ; \
		fi ; \
	done

unlink:
	for file in $(FILES) ; do \
		link="$(HOME)/`basename $$file`" ; \
		if [ -e $$link ] ; \
		then \
			rm $$link ; \
		fi ; \
	done
