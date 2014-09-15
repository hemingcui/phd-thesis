## setting the ratio ##
set terminal postscript eps color enhanced "NimbusSanL-Regu, 20" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb"
set size 3, 2

## LABEL ##
set ylabel "Normalized Execution Time" font ",28" offset 10,7
set xlabel "                ImageMagick                                         STL libstdc++-v3                                             PARSEC           SPLASH-2x               Phoenix 2             NPB 3.3.1      " font ",28" offset 0,3.5


## SCALE ##
set auto x
set auto y
set yrange [0:2.99]
set xtics nomirror rotate by -90 offset 0,0 font ",20"
set ytics nomirror font ",32"

## STYLE ##
set boxwidth 0.5
# globally set the offset of histogram will change the position of newhistogram title
set style histogram title offset 0,3 font ",28"
set style data histogram
set style histogram rowstack gap 2

set border 3
set key left Left reverse font ",30" at 26,2.5,0 spacing 2

set bmargin 14
set lmargin 5


## PLOT ##
BREAK = 2.75
break(x) = (x>BREAK) ? (BREAK+(x-BREAK)/5.2) : (x)
g(x) = (x <= 2.75 ? 1/0 : 2.8)

set style rect fs empty border rgb"black" lw 2
set obj rect from -2, 0 to 114 , 1.127
plot \
newhistogram , \
	'overhead.dat' index 0 u 2:xtic(1) notitle fs pattern 0 lt -1 lc rgb"black", \
	'' index 0 u 3 notitle fs pattern 12 lt -1 lc rgb"black", \
	'' index 0 u 4 notitle fs pattern 7 lt -1 lc rgb"black", \
	'' index 0 u 5 notitle fs pattern 3 noborder lc rgb"black", \
newhistogram ,\
	'overhead.dat' index 1 u 2:xtic(1) notitle fs pattern 0 lt -1 lc rgb"black", \
	'' index 1 u 3 notitle fs pattern 12 lt -1 lc rgb"black", \
	'' index 1 u 4 notitle fs pattern 7 lt -1 lc rgb"black", \
	'' index 1 u 5 notitle fs pattern 3 noborder lc rgb"black", \
newhistogram , \
	'overhead.dat' index 2 u 2:xtic(1) notitle fs pattern 0 lt -1 lc rgb"black", \
	'' index 2 u 3 notitle fs pattern 12 lt -1 lc rgb"black", \
	'' index 2 u 4 notitle fs pattern 7 lt -1 lc rgb"black", \
	'' index 2 u 5 notitle fs pattern 3 noborder lc rgb"black", \
newhistogram , '' index 3 u (break($2)):xtic(1) notitle fs pattern 0 lt -1 lc rgb"black",\
	'' index 3 u (break($3)) notitle fs pattern 12 lt -1 lc rgb"black", \
	'' index 3 u (break($4)) notitle fs pattern 7 lt -1 lc rgb"black", \
	'' index 3 u (break($5)) notitle fs pattern 3 noborder lc rgb"black", \
        '' index 3 u (column(0)+58):(break($6)+0.05):($6>BREAK?sprintf("%0.2f",$6):"") with labels font ",28" offset 0.5,0.2 notitle, \
        '' index 3 u ($0+58-0.4):(g($6)):(1.6):(0.02) w vectors lt -1 lc rgb "white" lw 6 nohead notitle, \
        '' index 3 u ($0+58-0.3):(g($6)+0.016):(0.6):(0.01) w vectors lt -1 lc rgb "black" lw 1 nohead notitle, \
        '' index 3 u ($0+58-0.3):(g($6)-0.016):(0.6):(0.01) w vectors lt -1 lc rgb "black" lw 1 nohead notitle, \
newhistogram , '' index 4 u 2:xtic(1) notitle fs pattern 0 lt -1 lc rgb"black",\
	'' index 4 u 3 notitle fs pattern 12 lt -1 lc rgb"black", \
	'' index 4 u 4 notitle fs pattern 7 lt -1 lc rgb"black", \
	'' index 4 u 5 notitle fs pattern 3 noborder lc rgb"black", \
newhistogram , '' index 5 u 2:xtic(1) notitle fs pattern 0 lt -1 lc rgb"black",\
	'' index 5 u 3 notitle fs pattern 12 lt -1 lc rgb"black", \
	'' index 5 u 4 notitle fs pattern 7 lt -1 lc rgb"black", \
	'' index 5 u 5 notitle fs pattern 3 noborder lc rgb"black", \
newhistogram , '' index 6 u (break($2)):xtic(1) title "no hints" fs pattern 0 lt -1 lc rgb"black",\
	'' index 6 u (break($3)) title "generic soft barrier" fs pattern 12 lt -1 lc rgb"black", \
	'' index 6 u (break($4)) title "specific soft barrier" fs pattern 7 lt -1 lc rgb"black", \
	'' index 6 u (break($5)) title "performance critical section" fs pattern 3 noborder lc rgb"black"

## obselete##
#plot 1.199832367 notitle lc rgb "gray", \
#     'overhead.dat' u (break($2)):xtic(1) w boxes title "no performance hint" lc rgb"black" fs solid 0.25 noborder, \
#     ''             u (break($3))         w boxes notitle lc rgb"black" fs solid 0.5 noborder, \
#     ''             u (break($4))         w boxes title "lineup performance hint" lc rgb"black" fs solid 0.5 noborder, \
#     ''             u (break($5))         w boxes title "non-det performance hint" lc rgb"black" fs solid 0.8 noborder
#	 ''             u (column(0)):(break($6)+0.05):($6>2.25?sprintf("%0.2f",$6):"") with labels font ",28" offset 0.5,0.2 notitle, \
#     '' u ($0-0.35):(g($6)):(1.5):(0.02) w vectors lt -1 lc rgb "white" lw 10 nohead notitle, \
#     '' u ($0-0.25):(g($6)+0.01):(0.5):(0.02) w vectors lt -1 lc rgb "black" lw 1 nohead notitle, \
#     '' u ($0-0.25):(g($6)-0.01):(0.5):(0.02) w vectors lt -1 lc rgb "black" lw 1 nohead notitle
 
