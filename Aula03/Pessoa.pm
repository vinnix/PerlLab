package Pessoa;
use warnings;
use strict;
my @Todos; # ** má prática **

sub new {  # construtor, por convenção
  my $classe = shift;
  my $self = {@_};
  bless ($self, $classe);
  push @Todos, $self;
  return $self;
}
sub pre {$_[0]->{pre } = $_[1] if defined $_[1]; $_[0]->{pre }}
sub nome {$_[0]->{nome} = $_[1] if defined $_[1]; $_[0]->{nome}}
sub ocup {$_[0]->{ocup} = $_[1] if defined $_[1]; $_[0]->{ocup}}
sub pais {$_[0]->{pais} = $_[1] if defined $_[1]; $_[0]->{pais}}
sub completo { my $self = shift;
	return $self->{pre} . " " . $self->{nome};
}

sub quantos { scalar @Todos }
sub todos { @Todos }
sub DESTROY { # nunca executa, por causa de @Todos; só no término
  my $self = shift; print "Matando ", $self->completo, "\n"; 
}

1;
