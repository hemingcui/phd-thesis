set terminal postscript eps color enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"

set size 2,2

## LABEL ##
set ylabel "Normalized Execution Time" font ",32" offset 8,1.5
set xlabel "PARSEC                          SPLASH-2x                                Phoenix 2" font ",32" offset 0,2
## SCALE ##
set auto x
#set auto y
set yrange [0:21]
set xtics nomirror
set ytics nomirror font ",36" 

## STYLE ##
set style data histogram
set style histogram cluster gap 1
set style histogram title offset 0,1 font ",28"
set style fill solid border -1
set xtics nomirror rotate by -90 offset 0,0 font ",28"

set key left Left reverse font ",34" at 16,20,0 spacing 3 samplen 6

set bmargin 15.5

set border 3

## PLOT ##

BREAK = 20
break(x) = (x>BREAK) ? (BREAK+(x-BREAK)/140) : (x)
g(x) = (x <= 20 ? 1/0 : 18.5)

plot \
newhistogram , \
     'comparison.dat' index 0 using (break($2)):xtic(1) notitle fs pattern 2 lt -1 lc rgb"black", \
     ''               index 0 using (break($3)) notitle  fs pattern 12 lt -1 lc rgb "black", \
     ''               index 0 using (break($5))         notitle fs pattern 0 lt -1 lc rgb"black" , \
     '' index 0 u (column(0)):(break($3)):($3>100?sprintf("%0.2f",$3):"") with labels font ",28" offset 1.0,0.9 notitle, \
     '' index 0 u (column(0)):(break($3)):($3>BREAK&&$3<25?sprintf("%0.2f",$3):"") with labels font ",28" offset -1.0,0.9 notitle, \
     '' index 0 u ($0-0.14):(g($3)):(0.285):(0.1) w vectors lt -1 lc rgb "white" lw 7 nohead notitle, \
     '' index 0 u ($0-0.14):(g($3)+0.2):(0.285):(0.1) w vectors lt -1 lc rgb "black" lw 1 nohead notitle, \
     '' index 0 u ($0-0.14):(g($3)-0.2):(0.285):(0.1) w vectors lt -1 lc rgb "black" lw 1 nohead notitle, \
newhistogram , \
     'comparison.dat' index 1 using 2:xtic(1) notitle fs pattern 2 lt -1 lc rgb"black", \
     ''               index 1 using 3         notitle fs pattern 12 lt -1 lc rgb "black", \
     ''               index 1 using 5         notitle fs pattern 0 lt -1 lc rgb"black", \
newhistogram , \
     'comparison.dat' index 2 using (break($2)):xtic(1) title "Parrot" fs pattern 2 lt -1 lc rgb"black", \
     ''               index 2 using (break($3))         title "DThreads-sync" fs pattern 12 lt -1 lc rgb "black", \
     ''               index 2 using (break($5))         title "CoreDet-sync" fs pattern 0 lt -1 lc rgb"black"

