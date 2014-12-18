eval 'exec perl -w -S $0 ${1+"$@"}'
    if 0;
while($pdf = shift @ARGV) {
    $eps = $ps = $pdf;
    $ps  =~ s/\.pdf/.ps/;
    $eps =~ s/\.pdf/.eps/;
    system "pdftops $pdf";
    system "ps2eps -l -f -B -s b0 -c -n -P $ps";
    system "epstopdf --nocompress $eps";
    unlink $eps, $ps;
}
