set terminal postscript eps enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
set ylabel "Overhead (%)"
set style data boxerror
set boxwidth 0.5 absolute

set key at 2.1,180,2

set border 2
set xzeroaxis lt 1 lw 2


set xtics nomirror
set ytics nomirror


set xrange[0:5]
set yrange [-20:180]


#set xtics rotate by 90 offset 0,0
set xtics ("PBZip2" 1, "barnes" 2, "volrend" 3, "water-\nnsquared" 4)
set ytics ("-20" -20, "0" 0, "50" 50, "100" 100, "150" 150, "180" 180)

set object 2 rect from 0.5,-23 to 4.5,-17 fc rgb "white" front fs pattern noborder

set boxwidth 0.25 absolute
plot "opt-overhead.dat" u ($1-0.125):2:3 t "no opt" fs pattern 1,  '' u ($1+0.125):4:5 t "skip sync" fs solid 0.5
