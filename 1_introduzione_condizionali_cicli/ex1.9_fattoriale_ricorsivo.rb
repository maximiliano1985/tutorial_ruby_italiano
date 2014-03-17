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

# Nono esempio, fattoriale in forma ricorsiva

#
# Esempio fattoriale (versione ricorsiva)
#
 
# definisco funzione fattoriale
def fatt(n)
  if n < 1 then
    return 1 ;
  else
    return n*fatt(n-1) ;
  end
end
 
n = 10 ;
puts "Fattoriale #{n} = #{fatt(n)}\n" # uso funziona fattoriale