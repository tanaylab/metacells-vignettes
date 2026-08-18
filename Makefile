NAME = metacells-vignettes

ALL_SOURCE_FILES = $(shell git ls-files)

NOTEBOOK_FILES = $(filter notebooks/%.ipynb, $(ALL_SOURCE_FILES))

# Taken from the file system rather than from `git ls-files`, because a pattern rule whose
# prerequisites do not exist is silently skipped, so a stale index would quietly generate nothing.
IMAGE_FILES = $(wildcard images/*)

HTML_FILES = $(patsubst notebooks/%.ipynb, docs/%.html, $(NOTEBOOK_FILES))

.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python3 -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

clean: clean-docs  ## remove all generated documents

clean-docs:
	rm -f $(HTML_FILES)

ci: docs staged  ## check everything in a CI server

staged:  ## check everything is staged for git commit
	@if git status . | grep -q 'Changes not staged\|Untracked files'; \
	then \
	    git status; \
	    echo 'There are unstaged changes (run `git add .`).'; \
	    false; \
	else true; \
	fi

.PHONY: docs
docs: html  ## generate all the viewable documents

.PHONY: html
html: $(HTML_FILES)  ## generate the viewable HTML documents

# The notebooks are converted as they are, never re-executed: re-running them needs the ~48GB of
# data in `blobs` and an R environment with `MCView`. Embedding the images and clearing the
# `require.js` and `MathJax` URLs (which otherwise point at a CDN) makes each document stand alone,
# so viewing it needs no network and no other file in this repository.
docs/%.html: notebooks/%.ipynb $(IMAGE_FILES)
	jupyter nbconvert \
	    --to html \
	    --embed-images \
	    --HTMLExporter.require_js_url= \
	    --HTMLExporter.mathjax_url= \
	    --output-dir docs \
	    $<
