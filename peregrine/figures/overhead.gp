set terminal postscript eps enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
set ylabel "Normalized Execution Time"
set style data boxerror

set key at 10,150,2

set border 2
set xzeroaxis lt 1 lw 2

set xtics nomirror
set ytics nomirror

set xrange[0:19]
set yrange [0:150]

set xtics rotate by 90 offset 0,0
set xtics ("   Apache-TPUT" 1 , "   Apache-RESP" 2 , "        PBZip2" 3 , \
           "          aget" 4 , "        pfscan" 5 , "        barnes" 6 , \
           "           fft" 7 , "     lu-contig" 8 , " lu-non-contig" 9,  \
           "         radix" 10, " water-spatial" 11, "water-nsquared" 12, \
           "         ocean" 13, "           fmm" 14, "      cholesky" 15, \
           "  blackscholes" 16, "     swaptions" 17, " streamcluster" 18)

set ytics ("0" 0, "0.5" 50, "1.0" 100, "1.5" 150, "2.0" 200, "2.5" 250, "3.0" 300)

set boxwidth 0.33 absolute
plot "overhead.dat" u ($1-0.165):4:5 t "Sync-schedule" fs pattern 2,\
                 '' u ($1+0.165):6:7 t "Hybrid schedule" fs solid 0.5
