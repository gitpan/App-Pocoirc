
use strict;
use warnings;

BEGIN { require 5.008; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'A command line tool for launching POE::Component::IRC clients',
  'AUTHOR' => 'Hinrik Örn Sigurðsson <hinrik.sig@gmail.com>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.47',
    'Test::Script' => '1.07'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'App-Pocoirc',
  'EXE_FILES' => [
    'bin/pocoirc'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'App::Pocoirc',
  'PREREQ_PM' => {
    'Class::Load' => '0.06',
    'Data::Dump' => '0',
    'IRC::Utils' => '0.06',
    'JSON::XS' => '0',
    'Module::Pluggable' => '0',
    'POE' => '1.310',
    'POE::Component::Client::DNS' => '0.99',
    'POE::Component::IRC::State' => '6.61',
    'Proc::Daemon' => '0.02',
    'Term::ANSIColor' => '0',
    'YAML::XS' => '0'
  },
  'VERSION' => '0.37',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



