#!/usr/bin/perl

my $input = $ARGV[0];
my @array = split(/\./, $input);
my $name = $array[0];
print "name: $name\n";
system("pdf2ps $name.pdf $name.ps");
system("ps2eps $name.ps");
