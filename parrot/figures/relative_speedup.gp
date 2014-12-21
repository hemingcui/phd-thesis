set terminal postscript eps color enhanced "NimbusSanL-Regu, 8" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"

## LABEL ##
set ylabel "Relative speed-up"

## SCALE ##
set auto x
#set auto y
#set yrange [0:1.49]
set xtics nomirror
set ytics nomirror

## STYLE ##
set style data histogram
#set style data boxerror
set style histogram cluster gap 1
set style fill solid border -1
#set boxwidth 0.9
#set boxwidth 0.33 absolute
#set xtic rotate by -45 scale 0 font ",8"
set xtics rotate by -90 offset -3,0

#set bmargin 10

## PLOT ##
plot 1 lc rgb"grey"  notitle, \
'relative_speedup.dat' using 2:xtic(1) title "xtern" fs solid 0.5 noborder, \
     ''                using 3         title "dthreads" fs solid 0.5 noborder, \
     ''                using 4         title "coredet" fs solid 0.5 noborder
