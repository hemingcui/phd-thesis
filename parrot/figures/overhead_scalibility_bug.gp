set terminal postscript eps color enhanced "NimbusSanL-Regu, 12" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"

## LABEL ##
set ylabel "Normalized Execution Time" font ",16" offset 2,0
set xlabel "Number of Cores" font ",16"

set style line 1 lt 1 pt 14
set style line 2 lt 2 pt 1
set style line 3 lt 3 pt 2
set style line 4 lt 4 pt 3
set style line 5 lt 5 pt 4
set style line 6 lt 6 pt 5
set style line 7 lt 1 pt 6
set style line 8 lt 2 pt 7
set style line 9 lt 3 pt 8
set style line 10 lt 5 pt 9
set style line 11 lt 6 pt 10
set style line 12 lt 1 pt 11
set style line 13 lt 2 pt 12
set style line 14 lt 3 pt 13
set style line 15 lt 4 pt 15
set style line 16 lt 5 pt 6


set yrange [0:3.99]

set datafile missing "-"
#set xtics nomirror rotate by -45 font ",8"
set key left Left reverse noenhanced maxrows 8 width 10 at 8, 4

set style data linespoints
set border 3
set xtics ("4" 4, "8" 8, "16" 16, "24" 24) nomirror
set ytics nomirror


plot 'overhead_scalibility_bug.dat' using ($1):2 notitle lc rgb"white" lt -1 pt 0 , \
for [j=89:106] '' using ($1):j title columnheader(j) w linespoints ls (j-(floor(j/16)*16)+1) lc rgb"black" ps 1.5 pi -1 lw 3


