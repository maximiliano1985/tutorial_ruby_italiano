#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: ex1.10_fattoriale_ricorsivo_puts.rb
#
#  Autori:
#     Enrico Bertolazzi and Carlos Maximiliano Giorgio Bort
#     Dipartimento di Ingeneria Industriale
#     Università di Trento
#
#  Sito web:
#     http://www.ing.unitn.it/~bertolaz/
#
#  Contatti:
#     enrico.bertolazzi@unitn.it
#     cm.giorgiobort@unitn.it
#
#  Copyright (c) 2014 Università di Trento. Tutti i diritti riservati.
#     
#-------------------------------------------------------------------------


# Decimo esempio, fattoriale in forma ricorsiva con stampe per visualizzare la ricorsione

#
# Esempio fattoriale (versione ricorsiva)
# con livello di chiamata
#
 
# definisco funzione fattoriale
def fatt(n)
  puts "Entra fatt(#{n})" ;
  res = 1 ;
  res = n*fatt(n-1) if n > 1 ;
  puts "Esce fatt(#{n})" ;
  return res ;
end
 
n  = 10 ;
fn = fatt(n) ;
puts "Fattoriale #{n} = #{fn}\n" # uso funziona fattoriale