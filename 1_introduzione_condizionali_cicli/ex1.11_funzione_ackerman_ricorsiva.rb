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