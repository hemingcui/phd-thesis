set terminal postscript eps enhanced "NimbusSanL-Regu, 8" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"

#set title ""
set boxwidth 0.2 absolute
set style fill solid 1.000000 border -1
set bmargin 7
set xtics rotate by -90 offset 0,0
set yrange [0:4]
set auto x
set ylabel "mm"

plot 'scalibility.dat' using ($0-0.45):2 index 0 with boxes title "non-det 8 threads over 4 threads" lc rgb '#87CEEB', \
     ''           using ($0-0.25):2 index 1 with boxes title "xtern 8 threads over 4 threads" lc rgb "#000080", \
     ''           using ($0-0.05):2 index 2 with boxes title "non-det 16 threads over 4 threads" lc rgb "#FFD700", \
     ''           using ($0+0.15):2:xticlabels(1) index 3 with boxes title "xtern 16 threads over 4 threads" lc rgb "#FF6347"
