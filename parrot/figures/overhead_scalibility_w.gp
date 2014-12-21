set terminal postscript eps color enhanced "NimbusSanL-Regu, 12" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"

## LABEL ##
set ylabel "Overhead"

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


set yrange [-1:4.99]

set datafile missing "-"
#set xtics nomirror rotate by -45 font ",8"
set key noenhanced maxrows 8

set style data linespoints
set xtics ("4" 4, "8" 8, "16" 16, "32" 32)

#set style rect fc rgb"black" fs solid 0.1 noborder
#set obj rect from 4, -0.5 to 32, 0.5

plot 'overhead_scalibility_w.dat' using ($1):2 notitle lc rgb"grey" lt -1 pt 0 , \
for [i=3:51] '' using ($1):i notitle lc rgb"grey" lt -1 pt 0, \
for [j=52:68] '' using ($1):j title columnheader(j) w linespoints ls (j-(floor(j/14)*14)+1) lc rgb"black" ps 1.5 pi -1 lw 3



#for [j=41:54] '' using ($1):j title columnheader(j) w linespoints ls (j-(floor(j/14)*14)+1)
