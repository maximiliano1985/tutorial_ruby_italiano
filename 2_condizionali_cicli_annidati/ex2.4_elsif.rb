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

#
# funzione a tratti, modo 1
#
def funz(x)
  if x <= 1 then
    return 1
  else
    if x <= 2 then
      return 2
    else
      if x <= 4 then
        return 3
      else
        if x <= 6 then
          return 4
        else
          if x <= 8 then
            return 5
          else
            return 6
          end
        end
      end
    end
  end
end
#
# funzione a tratti, modo 2
#
def funz2(x)
  if x <= 1 then
    return 1
  elsif x <= 2 then
    return 2
  elsif x <= 4 then
    return 3
  elsif x <= 6 then
    return 4
  elsif x <= 8 then
    return 5
  else
    return 6
  end
end
 
for i in (0..100) do
  x = i/10.0
  puts "x = #{x}, funz(x) = #{funz(x)}, funz2(x) = #{funz2(x)}"
end