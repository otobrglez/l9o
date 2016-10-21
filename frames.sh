#!/usr/bin/env bash
# set -e

# Sequential version
#p=0
#for i in $(seq 1 2 29 ; seq 29 -2 1); do
#  p=$[$p+1]
#  artii -f roman $1 | lolcat -S $i -p 4 -f | ansi2html -s solarized > $(printf "./frames/%02d-$i.html" $p)
#done

# Parallel version
# (seq -w 1 2 29 ; seq -w 29 -2 1)
text=$1; font=$2 p=0; for i in $(seq -w 1 2 70 ; seq -w 70 -5 1); do p=$[$p+1]; printf "%02d-$i-$font-$text\n" $p; done | \
  parallel --progress -j 8 'f=$(echo {} | cut -d "-" -f1); s=$(echo {} | cut -d "-" -f2); \
    font=$(echo {} | cut -d "-" -f3); text=$(echo {} | cut -d "-" -f4); \
    artii -f $font "$text" | lolcat -S $s -p 2 -f | ansi2html -l -s solarized > ./frames/$f-$s.html'
