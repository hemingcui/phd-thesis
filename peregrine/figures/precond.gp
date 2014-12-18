set terminal postscript eps enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
set ylabel "Remaining Conditionals (%)"
set style data boxerror

set nokey

set border 2
set xzeroaxis lt 1 lw 2

set xtics nomirror
set ytics nomirror

set xrange[1:19]
set yrange [0:100]

set xtics rotate by 90 offset 0,0
set xtics (                     "        Apache" 2 , "        PBZip2" 3 , \
           "          aget" 4 , "        pfscan" 5 , "        barnes" 6 , \
           "           fft" 7 , "            lu" 8 , "         radix" 9 , \
           " water-spatial" 10, "water-nsquared" 11, "       volrend" 12, \
           "         ocean" 13, "           fmm" 14, "      cholesky" 15, \
           "  blackscholes" 16, "     swaptions" 17, " streamcluster" 18)

set ytics ("0"  0, "10" 10, "20" 20, "30" 30, "40" 40, "50" 50,\
          "60" 60, "70" 70, "80" 80, "90" 90, "100" 100)

set boxwidth 0.25 absolute
plot "precond.dat" u ($1-0.125):(100*$3/$2):4 t "w/o simplication" fs pattern 2, \
                '' u ($1+0.125):(100*$5/$2):6 t "w/ simplication" fs solid 0.5, \
                '' u ($1+0.375):(100*$7/$2):8 t "lower bound" fs solid 0.1
