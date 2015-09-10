# Makefile to create symlinks for dotfiles/directories in home directory

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
DIR = "mac"
else
DIR = "linux"
endif

DOTFILES = $(shell ls -a dotfiles/$(DIR)/.[a-z]*)
VIM = $(shell ls -ad vim/.[a-z]*)
FILES = $(DOTFILES) $(VIM)

all: symlink

symlink:
	for file in $(FILES) ; do \
		link="$(HOME)/`basename $$file`" ; \
		if [ -e $$link ] ; \
		then \
			mv $$link $$link.bk ; \
		fi ; \
		ln -s $(PWD)/$$file $$link ; \
	done ; \

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
