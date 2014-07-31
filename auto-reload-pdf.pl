
#! /usr/bin/env perl
my @ACROREAD = ('acroread',@ARGV);
my $wfile  = $ACROREAD[$#ACROREAD];
my $wdelay = 1;
my $otime  = 0;
my $kid;
while(1) {
   my $ntime = (stat($wfile))[9];
   if($ntime != $otime) {
      $otime = $ntime;
      kill 9, $kid if($kid);
      unless(($kid = fork)) {
         exec @ACROREAD;
      }
   }
   select(undef, undef, undef, $wdelay);
}
