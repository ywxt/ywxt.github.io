#!/bin/sh
workdir=$(cd $(dirname $0); pwd)
rm -rf ./publish && mkdir $workdir/publish
for dir in "$workdir"/books/*; do
    if [ -d "${dir}" ]; then
        mdbook build $dir
	    mkdir $workdir/publish/$(basename $dir)
	    cp -r $dir/book/* $workdir/publish/$(basename $dir)
        echo "Build $(basename $dir) success."
    fi
done

cp $workdir/index.html $workdir/publish/index.html

