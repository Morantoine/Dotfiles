#!/bin/bash
for d in [^.]*/ ; do
    file=`find ./$d -type f`
    echo "file is"
    echo $file
done
