set terminal postscript eps color enhanced "NimbusSanL-Regu, 20" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
set size 3, 1.5

## LABEL ##
set ylabel "Normalized Execution Time" font ",28" offset 8,2
set xlabel "                ImageMagick                                         STL libstdc++-v3                                             PARSEC           SPLASH-2x               Phoenix 2             NPB 3.3.1      " font ",28" offset 0,4

## SCALE ##
set auto x
#set auto y
set yrange [0:29.9]
set xtic scale 0
set xtics nomirror rotate by -90 offset 0.4,0 font ",20"
set ytics nomirror font ",32"

## STYLE ##
#set style data histogram
#set style histogram cluster
set style fill solid border -1
set boxwidth 0.4 absolute

set border 3
set key left Left reverse font ",30" spacing 2 at 20,27,0

set bmargin 14

## PLOT ##
BREAK = 25
break(x) = (x>BREAK) ? (24 + (x-24)/8) : (x)
g(x) = (x <= BREAK ? 1/0 : 23)
plot 'hints.dat' using ($0-0.45):(break($2)):xtic(1) w boxes title "no hints" fs pattern 0 lt -1 lc rgb"black", \
     ''          using ($0-0.05):3         w boxes title "generic soft barrier" fs pattern 12 lt -1 lc rgb"black", \
     ''          using ($0-0.05):4         w boxes title "specific soft barrier" fs pattern 7 lt -1 lc rgb"black", \
     ''          using ($0-0.05):5         w boxes title "performance critical section" fs pattern 3 noborder lc rgb"black", \
     ''          using (column(0)):(break($6)):($6>BREAK?sprintf("%0.2f",$6):"") with labels font ",26" offset -0.5,1.0 notitle, \
     '' u ($0-0.75):(g($6)-0.05):(0.6):(1.2) w vectors lt -1 lc rgb "white" lw 5 nohead notitle, \
     '' u ($0-0.65):(g($6)+0.38):(0.4):(0.8) w vectors lt -1 lc rgb "black" lw 1 nohead notitle, \
     '' u ($0-0.65):(g($6)-0.25):(0.4):(0.8) w vectors lt -1 lc rgb "black" lw 1 nohead notitle


