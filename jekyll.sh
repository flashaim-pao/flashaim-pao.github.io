#!/bin/bash
docker run --rm -it -v $PWD:/srv/jekyll -p 4000:4000 -p 35729:35729 jekyll/jekyll jekyll $@
