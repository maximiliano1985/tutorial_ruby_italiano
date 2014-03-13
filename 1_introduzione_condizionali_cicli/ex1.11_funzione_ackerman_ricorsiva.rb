#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: ex1.11_funzione_ackerman_ricorsiva.rb
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


# Undicesimo esempio, funzione di Ackerman

#
# Esempio funzione di Ackerman (versione ricorsiva)
#
 
def ackerman(m,n)
  puts "ackerman(#{m},#{n})" ;
  if m == 0 then
   return n+1 ;
  else
    if n == 0 then
      return ackerman(m-1,1) ;
    else
      return ackerman(m-1,akerman(m,n-1)) ;
    end
  end
end
 
a = ackerman(3,4) ;
puts "ackerman = #{a}\n"