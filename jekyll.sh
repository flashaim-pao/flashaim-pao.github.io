#!/bin/bash
docker run --rm -it -v $PWD:/srv/jekyll jekyll/jekyll jekyll $@
