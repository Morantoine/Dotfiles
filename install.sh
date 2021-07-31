#!/bin/bash
for d in */ ; do
    stow $d
done
