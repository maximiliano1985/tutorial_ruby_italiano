#!/usr/bin/env ruby
#-------------------------------------------------------------------------#
#  Esercitazioni in Laboratorio per il Corso di                           #
#  Fondamenti di Informatica e Calcolo Numerico, AA 2013/2014             #
#                                                                         #
#  Autori:   Enrico Bertolazzi e Carlos Maximiliano Giorgio Bort          #
#            Dipartimento di Ingeneria Industriale, Universita` di Trento #
#  Sito web: http://www.ing.unitn.it/~bertolaz/                           #
#                                                                         #
#  Contatti: enrico.bertolazzi@unitn.it, cm.giorgiobort@unitn.it          #
#                                                                         #
#  Copyright (c) 2014 E.Bertolazzi e C.M. Giorgio Bort                    #
#-------------------------------------------------------------------------#


=begin
  Scrivere una funzione chiamata 'from10to3' che prende in ingresso un intero
  definito in base 10, lo rappresenta in base 3, e restituisce la rappresentazione
  sotto forma di stringa.

  Procedura: dividere il numero da convertire per la base b fino a quando
  l'ultimo quoziente e' minore della base stessa (b), dopodiche' il numero
  convertito si ottiene prendendo l'ultimo quoziente e tutti i resti delle
  divisioni, procedendo dall'ultimo resto al primo e scrivendoli da sinistra
  verso destra.
=end



################################################################################
# RISOLVERE L'ESERCIZIO QUI
################################################################################

# Soluzione ottimale
#def from10to3(intero)
#  raise ArgumentError, "Il numero in ingresso a from10to3 deve essere un intero" unless intero.class == Integer
#  return intero.to_s(3)
#end

# Soluzione alternativa (non ottimale)
def from10to3(intero)
  raise ArgumentError, "Il numero in ingresso a from10to3 deve essere un intero" unless intero.class == Fixnum
  s = ''
  x = intero
  base = 3
  while 
    s << (x % base).to_s
    x /= base
    break if x < base
  end
  s << x.to_s
  return s.reverse!
end

################################################################################
# NON MODIFICARE LE LINEE DI CODICE RIPORTATE QUI DI SEGUITO
################################################################################
load "../checker.rb" if __FILE__ == $0
