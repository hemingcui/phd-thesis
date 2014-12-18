set terminal postscript eps enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
set ylabel "Slice Size/Trace Size (%)"
set style data boxerror

set key at 19,80,2

set border 2
set xzeroaxis lt 1 lw 2

set xtics nomirror
set ytics nomirror

set xrange[1:19]
set yrange [0:80]

set xtics rotate by 90 offset 0,0
set xtics ("        Apache" 2 , "        PBZip2" 3 , \
           "          aget" 4 , "        pfscan" 5 , "        barnes" 6 , \
           "           fft" 7 , "     lu-contig" 8 , " lu-non-contig" 9,  \
           "         radix" 10, " water-spatial" 11, "water-nsquared" 12, \
           "         ocean" 13, "           fmm" 14, "      cholesky" 15, \
           "  blackscholes" 16, "     swaptions" 17, " streamcluster" 18)

set ytics ("0"  0, "10" 10, "20" 20, "30" 30, "40" 40, "50" 50,\
          "60" 60, "70" 70, "80" 80, "90" 90, "100" 100)

set label rotate by 90 "n/a   " font "NimbusSanL-Regu,15" at 2.25, 2 
set label rotate by 90 "0.07  " font "NimbusSanL-Regu,15" at 3.25, 2 
set label rotate by 90 "0.0005" font "NimbusSanL-Regu,15" at 8.25, 2
set label rotate by 90 "0.0003" font "NimbusSanL-Regu,15" at 16.25, 2 
set label rotate by 90 "0.01  " font "NimbusSanL-Regu,15" at 17.25, 2 
set label rotate by 90 "0.33  " font "NimbusSanL-Regu,15" at 17.83, 2
set label rotate by 90 "0.09  " font "NimbusSanL-Regu,15" at 18.27, 2 

set boxwidth 0.33 absolute
plot "slicing.dat" u ($1-0.166):(100*$3/$2):4 t "w/o simplification" fs pattern 2, \
                '' u ($1+0.167):(100*$5/$2):6 t "w/ simplification" fs solid 0.5
