# vim: set et ft=gnuplot sw=4 :

outputfile="gen-graph-" . format . "-kr-satisfiable-" . ps . "-" . ts . ".tex"
proportionsat="data/ps" . ps . "-ts" . ts . "-kr." . format . ".proportion-sat.plot"

if (ps == 30) { \
    set terminal tikz standalone color size 1.1in,0.9in font '\scriptsize' preamble '\usepackage{microtype,amssymb,amsmath}' \
} else { \
    set terminal tikz standalone color size 0.9in,0.9in font '\scriptsize' preamble '\usepackage{microtype,amssymb,amsmath}' \
}

set output outputfile

set lmargin screen 0
set tmargin screen 0.95
set bmargin screen 0.05
if (ps == 30) set rmargin at screen 0.9; else set rmargin at screen 1;

unset xlabel
unset ylabel
set xrange [0:1 + (0.5 / ps)]
set noxtics
set yrange [0:1]
set noytics
set size square
set cbtics out scale 0.5 nomirror offset -1
set cbtics 0.5

if (ps==30) set colorbox; else unset colorbox;

load "puyl.pal"

plot proportionsat u ($2/(ps-1)):($1/divide):($3) matrix w image notitle

