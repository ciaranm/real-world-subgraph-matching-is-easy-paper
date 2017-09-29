# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 2.6in,2.2in font '\footnotesize' preamble '\usepackage{microtype,times}'
set output "biiiig-data-pdbs.tex"

load "../chroma.pal"

set xrange [0:2000]
set xlabel "Recursive calls"
set ylabel "Instances solved"
set yrange [0:3600]
set key Right at screen 0.465, screen 0.458
set border 3
set grid ls 101
set xtics nomirror
set ytics nomirror
set key off
set title "PDBS"
set ytics add ("$3600$" 3600) ("" 3500)

plot \
    "<cut -d' ' -f6 ../data/Xpdbs-mysip.txt" u 1:(1) smooth cumulative w l ls 1 lw 2
