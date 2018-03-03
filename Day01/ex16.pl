#!/bin/env perl
#
#
#

print @culturas = ('Aveia ', 'Ervilha ', 'Lentilha ',
'Cevada '), "\n"; # atribuição
print $culturas[2], "\n"; # indexação
print @culturas[1,3], "\n"; # fatiamento
print sort @culturas, "\n"; # ordenação (preced.!)
print sort (@culturas), "\n"; # ordenação com aviso
print sort(@culturas), "\n"; # ordenação sem aviso
print ((sort @culturas), "\n"); # ordenação
print reverse (@culturas), "\n"; # inversão
print reverse (sort @culturas), "\n"; # ordenação e inversão
print 5 .. 11, "\n"; # geração de faixas
print reverse (5 .. 11), "\n"; # ... invertidas
print @culturas[1..3], "\n"; # fatiamento com faixas
print @culturas[2, -1..1], "\n"; # fatiamento combinado
print sort( 5 .. 11 ), "\n"; # ordenação alfanumérica
