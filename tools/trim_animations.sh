#!/bin/sh
# Usage: trim_animation.sh front.animated.2bpp front.dimensions

case $(cat $2) in
	U) bytes=400;; # $55="U"; 5*5*16=400
	f) bytes=576;; # $66="f"; 6*6*16=576
	w) bytes=784;; # $77="w"; 7*7*16=784
	*) bytes=-0;;  # invalid size; don't trim
esac

temp_file=$(mktemp)
head -c $bytes $1 > $temp_file
mv $temp_file $1