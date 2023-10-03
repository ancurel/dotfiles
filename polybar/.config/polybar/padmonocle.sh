#!/bin/bash

main=$(bspc query -M -m 1)

padTiled(){
  bspc config -d $1 top_padding 22
  bspc config -d $1 left_padding 5
  bspc config -d $1 right_padding 5
  bspc config -d $1 bottom_padding 5
}
padMonocle(){
  bspc config -d $1 top_padding 32 
  bspc config -d $1 left_padding 0
  bspc config -d $1 right_padding 0
  bspc config -d $1 bottom_padding 0
}

for d in `bspc query -D -m 1`; do
  padTiled $d 
done

while read -ra l; do
  if [[ $main == ${l[1]} ]]; then
    case ${l[3]} in
      monocle)
        padMonocle "${l[2]}"
        ;;
      tiled)
        padTiled "${l[2]}"
        ;;
    esac
  fi
done < <(bspc subscribe desktop_layout)


# vim: set syntax=bash ts=2 sw=2
