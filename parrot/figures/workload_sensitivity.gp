set terminal postscript color eps enhanced "NimbusSanL-Regu, 12" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"

## LABEL ##
set ylabel "Normalized Execution Time" font ", 16" offset 0.9,7
set xlabel "Size of Workloads" font ", 16" offset 0,0

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


## SCALE ##
#set auto x
#set auto y
set yrange [0:15]
set xtics nomirror
set ytics nomirror

## STYLE ##
#set boxwidth 0.2 absolute
set style data linespoints
set style fill solid border -1
#set xtics rotate by -90 offset -1.5,0

set datafile missing "-"
set xtics ("small" 1, "medium" 2, "large" 3, "native" 4) font ",16"

#reset
unset key
bm = 0.08
lm = 0.05
rm = 0.95
gap = 0.02
size = 3.2
y1 = 0.0; y2 = 5.5; y3 = 9; y4 = 32

set multiplot
set ytics nomirror
set lmargin at screen lm
set rmargin at screen rm
set bmargin at screen bm
set tmargin at screen bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) )

set yrange [y1:y2]


set border 3

## PLOT ##
plot 'workload_sensitivity.dat' using ($1):2 notitle lc rgb"white" lt -1 pt 0, \
for [j=91:100] '' using ($1):j title columnheader(j)  w linespoints ls (j-(floor(j/14)*14)+1) lc rgb "black" ps 1.5 pi -1 lw 3

set arrow from screen lm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0 to screen \
lm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 nohead

set arrow from screen lm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0  + gap to screen \
lm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 + gap nohead

unset xtics
unset ylabel
unset xlabel
set key maxcols 1 font ",14"
set border 2

set bmargin at screen bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap
set tmargin at screen bm + size + gap - 0.2
set yrange [y3:y4]

plot 'workload_sensitivity.dat' using ($1):2 notitle lc rgb"white" lt -1 pt 0, \
for [j=92:101] '' using ($1):j title columnheader(j)  w linespoints ls (j-(floor(j/14)*14)+1) lc rgb "black" ps 1.5 pi -1 lw 3


unset multiplot
