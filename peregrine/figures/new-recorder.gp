set terminal postscript eps enhanced "NimbusSanL-Regu, 32" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
set ylabel "Slowdown (Times)"
set style data boxerror

set key at 10,150,2

set border 2
set xzeroaxis lt 1 lw 2

set xtics nomirror
set ytics nomirror

set xrange[0:10]
set yrange [0:40]

set xtics rotate by 90 offset 0,0
set xtics ("         aget" 1 , "          fft" 2 , \
           "lu-non-contig" 3 , "        radix" 4 , "water-spatial" 5, \
           "        ocean" 6 , "          fmm" 7 , "    swaptions" 8)

set ytics ("0" 0, "10" 10, "20" 20, "30" 30, "40" 40)

set boxwidth 0.5 absolute
plot "new-recorder.dat"  u ($1):($3/$2):4 t "" fs solid 0.5
