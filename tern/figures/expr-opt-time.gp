set terminal postscript eps enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
#set terminal  postscript
#set term post eps font "Times New Roman,26"
set border 1

set key at 1.1,1500,2

set style data histogram
set style histogram cluster gap 1

set xrange[-1:4]
set yrange [0:1500]

set xtics nomirror
set ytics nomirror

set ylabel "Constraint checking time (ms)"
#set xlabel "Applications"

#set xtics rotate by 45 offset -2,-2
set xtics ("Apache" 0, "fft" 1, "lu" 2, "radix" 3)
set ytics ("0.2" 200, "0.4" 400, "0.6" 600, "0.8" 800, "8.0" 1500)
set line 

set object 2 rect from 0,900 to 4,1000 fc rgb "white" front fs pattern noborder
set object 3 rect from -1,0 to -0.997,900 fc rgb "white" front fs pattern
set object 4 rect from -1,1000 to -0.997,1500 fc rgb "white" front fs pattern
set label "7.85" at 1.5,1400

#set boxwidth 0.25 absolute
plot 'expr-opt-time.dat' using 2 t "no opt" fs pattern 2, '' using 3 t "w/ simplify" fs pattern 1, '' \
using 4 t "w/ slice" fs pattern 6, '' using 5 t "w/ both" fs solid 0.5
