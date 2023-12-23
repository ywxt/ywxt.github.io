#!/bin/sh
workdir=$(cd $(dirname $0); pwd)
mkdir $workdir/publish
for dir in $workdir/books
do
    if test -d $dir
    then
        mdbook build $dir
	mkdir $workdir/publish/$(basename $dir)
	cp -r $dir/book/* $workdir/publish/$(basename $dir)
    fi
done

