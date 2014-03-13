#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: ex1.7_vettori.rb
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

# Settimo esempio, uso dei vettori

#
# Esempio trova il massimo
#
# inizializza vettore
a = [1,-2,3,189,-23,2,34,46,343,12] ;
# preparazione
l = a.length
m = a[0]
i = 1
while i < l do
  m = a[i] if m < a[i] 
  i = i + 1
end
puts "Il massimo e`: #{m}"
puts "Usando metodo Ruby: #{a.max}"