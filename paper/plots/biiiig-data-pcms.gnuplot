# vim: set et ft=gnuplot sw=4 :

set style line 102 lc rgb '#a0a0a0' lt 1 lw 1
set border ls 102
set colorbox border 102
set key textcolor rgb "black"
set tics textcolor rgb "black"
set label textcolor rgb "black"

set terminal tikz standalone color size 2.6in,2.2in font '\footnotesize' preamble '\usepackage{microtype}'
set output "biiiig-data-pcms.tex"

load "../chroma.pal"

set xrange [0:]
set xlabel "Recursive calls"
set ylabel "Instances solved"
set yrange [0:1800]
set border 3
set grid ls 101
set xtics nomirror
set ytics nomirror add ("$1800$" 1800)
set key off
set title "PCM"
set logscale x
set xrange [1:1e7]
set format x '$10^{%T}$'
set key bottom right

plot \
    "<cut -d' ' -f4 ../../biiiiiig-data/pcms/results-vf2" u 1:(1) smooth cumulative w l ls 5 lw 2 ti 'VF2', \
    "<cut -d' ' -f4 ../../biiiiiig-data/pcms/results" u 1:(1) smooth cumulative w l ls 1 lw 2 ti 'Gecode', \


