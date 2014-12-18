set terminal postscript eps enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
set ylabel "Normalized Execution Time"
set style data boxerror

set key at 10,320,2

set border 1
set xzeroaxis lt 1 lw 2

set xtics nomirror
set ytics nomirror

set xrange[0:19]
set yrange [0:350]

set xtics rotate by 90 offset 0,0
set xtics ("   Apache-TPUT" 1 , "   Apache-RESP" 2 , "        PBZip2" 3 , \
           "          aget" 4 , "        pfscan" 5 , "        barnes" 6 , \
           "           fft" 7 , "     lu-contig" 8 , " lu-non-contig" 9,  \
           "         radix" 10, " water-spatial" 11, "water-nsquared" 12, \
           "         ocean" 13, "           fmm" 14, "      cholesky" 15, \
           "  blackscholes" 16, "     swaptions" 17, " streamcluster" 18)

set ytics ("0" 0, "0.5" 50, "1.0" 100, "1.5" 150, "2.0" 200, "2.5" 250,\
           "6.0" 300, "7.0" 350)

# First, draw the broken y axis.
set object 1 rect from 0,0 to 0.002,262 fc rgb "white" front fs pattern
set object 2 rect from 0,287 to 0.002,350 fc rgb "white" front fs pattern

# Second, break the bar.
set object 3 rect from 10,262 to 12,287 fc rgb "white" front fs solid 1.0 noborder

# Third, add real number label on top of the broken bar.
set label "6.11" font "NimbusSanL-Regu,15" at 11.25, 320 

set boxwidth 0.25 absolute
plot "opt.dat" u ($1-0.25):2:3 t "Semaphore relay" fs pattern 5, \
     '' u ($1):6:7 t "Flag relay" fs solid 0.1, \
     '' u ($1+0.25):8:9 t "Skip wait" fs solid 0.5

