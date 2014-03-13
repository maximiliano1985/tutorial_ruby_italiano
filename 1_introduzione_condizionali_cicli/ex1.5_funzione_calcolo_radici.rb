#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: ex1.5_funzione_calcolo_radici.rb
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

# Quinto esempio, come ex1.4.rb ma con funzione
#
# Esempio calcolo radici di 
#  a * x^2 + b * x + c = 0
#
def radici_quadratica(a,b,c)
  #
  # calcolo discriminante
  #
  delta = b^2 - 4 * a * c
  if delta >= 0 then
    # caso radici reali
    sdelta = Math.sqrt(delta) 
    x1r = (-b+sdelta)/(2*a) ;
    x2r = (-b-sdelta)/(2*a) ;
    x1i = 0 ;
    x2i = 0 ;
  else
    sdelta = Math.sqrt(-delta) 
    x1r = -b/(2*a) ;
    x2r = -b/(2*a) ;
    x1i = sdelta/(2*a) ;
    x2i = -sdelta/(2*a) ;
  end
  return [x1r,x1i,x2r,x2i] 
end
 
res = radici_quadratica(1,2,3) 
 
puts "Prima radice:"
print "Parte reale      = ", res[0], "\n"
print "Parte imaginaria = ", res[1], "\n"
 
puts "Seconda radice:"
puts "Parte reale      = #{res[2]}"
puts "Parte imaginaria = #{res[3]}"
