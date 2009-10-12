package ConfigReader;

use strict;

sub read_config ($) {
   my ($file_name) = @_;
   my %config;
   open( CNF, '<'.$file_name ) or die 'sh*** cannot open file : '.$!;
   while (<CNF>) {
      chomp;      # keine Zeilenumbrüche
      s/#.*//;    # keine Kommentare
      s/^\s+//;   # keine anfangs-whites
      s/\s+$//;   # und keine am Ende
      next unless length;   # na, was übrig, wenn ja, dann...
      my ($name, $value) = split(/\s*=\s*/, $_, 2);
      $config{$name}=$value;
   }
   close CNF or die 'shit happens';
   return %config;
}

1;
