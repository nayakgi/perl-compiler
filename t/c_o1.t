#! /usr/bin/env perl
# better use testc.sh -O1 for debugging
BEGIN {
  unless (-d ".svn" or -d '.git') {
    print "1..0 #SKIP Only if -d .svn|.git\n";
    exit;
  }
  if ($ENV{PERL_CORE}){
    chdir('t') if -d 't';
    @INC = ('.', '../lib');
  } else {
    unshift @INC, 't';
  }
  require 'test.pl'; # for run_perl()
}
use strict;
my $DEBUGGING = ($Config{ccflags} =~ m/-DDEBUGGING/);
my $ITHREADS  = ($Config{useithreads});

prepare_c_tests();

my @todo  = todo_tests_default("c_o1");
my @skip = ();
push @skip, 15 if $] == 5.010000 and $ITHREADS and !$DEBUGGING; # hanging;
#push @skip, 29 if $] > 5.015; #hangs

run_c_tests("C,-O1", \@todo, \@skip);
