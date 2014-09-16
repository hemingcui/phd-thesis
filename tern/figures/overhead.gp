set terminal postscript eps enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
#set terminal  postscript
#set term post eps font "Times New Roman,24"
#set multiplot
set ylabel "Overhead (%)"
set style data boxerror

set key left top;

set xrange[0:17]
set yrange[-20:40]

set border 2
set xzeroaxis lt 1 lw 2

set xtics nomirror
set ytics nomirror

set xtics rotate by 90 offset 0,0
set xtics ("Apache-TPUT" 1, "Apache-RESP" 2, "MySQL-TPUT" 3, "MySQL-RESP" 4, "PBZip2" 5, \
"fft" 6, "lu" 7, "barnes" 8, "radix" 9, "fmm" 10, "ocean" 11, "volrend" 12, "water-spatial" 13, "raytrace" 14, "water-nsquared" 15, "cholesky" 16)

# draw  hide the xtics.
set object 2 rect from 0.5,-20 to 16.5,-18 fc rgb "white" front fs pattern noborder

set nokey
set boxwidth 0.7 absolute
plot "overhead.dat" u 1:2:3 t "TERN" fs solid 0.5



