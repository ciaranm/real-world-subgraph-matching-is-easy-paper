# vim: set et ft=gnuplot sw=4 :

set style line 102 lc rgb '#a0a0a0' lt 1 lw 1
set border ls 102
set colorbox border 102
set key textcolor rgb "black"
set tics textcolor rgb "black"
set label textcolor rgb "black"

outputfile="graph-" . format . "-nodes-" . ps . "-l" . l . "-" . ts . ".tex"
nodesfile="../data/ps" . ps . "-ts" . ts . "-l" . l . "." . format . ".average-nodes.plot"

outputfile="graph-" . format . "-nodes-" . ps . "-l" . l . "-" . ts . ".tex"
nodesfile="../../experiments/flint-results/" . format . "-" . ps . "-" . ts . "-l" . l . "-nodes.plot"

if (l == 20) { \
    set terminal tikz standalone color size 1.1in,0.9in font '\footnotesize' preamble '\usepackage{microtype,amssymb,amsmath}' \
} else { \
    set terminal tikz standalone color size 0.9in,0.9in font '\footnotesize' preamble '\usepackage{microtype,amssymb,amsmath}' \
}

load "../chromasequencefromwhitetoblack.pal"

set output outputfile

set lmargin screen 0
set tmargin screen 0.95
set bmargin screen 0.05
if (ps == (ts == 150 ? 30 : 25)) set rmargin at screen 0.9; else set rmargin at screen 1;

set datafile missing "fail"

unset xlabel
unset ylabel
set xrange [-0.005:1.005]
set noxtics
set yrange [-0.005:1.005]
set noytics
set size square
set cbtics out scale 0.5 nomirror offset -1
set cbtics 2 add ('fail' 8)

set palette positive
set format cb '$10^{%.0f}$'
if (l == 20) set colorbox; else unset colorbox;
set cbrange [0:8]

plot nodesfile u ($1/divide):($2/divide):($3>=0?log10($3+1):1e10) matrix w image notitle
