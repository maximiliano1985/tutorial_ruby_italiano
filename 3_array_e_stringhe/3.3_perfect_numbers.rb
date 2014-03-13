#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: 3.3_perfect_numbers.rb
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

=begin
 
Calcola i numeri perfetti minori di `10000`
 
Un numero perfetto e` un intero uguale alla somma dei suoi divisori (escluso se stesso).
Ad esempio 6 e` un numero perfetto infatti i suoi divisori 1, 2, 3 hanno somma 6.
 
=end
 
# numeri perfetti: 6, 28, 496, 8128, 33550336
 
#____________________________
def is_perfect?(n)
  # accumulo i divisori
  acc = 1 # 1 e` sicurmente un divisore
  for i in 2..n/2 do # se i > n/2 di sicuro non divide n
    acc += i if (n%i) == 0 # accumulo i divisori
  end
  return acc == n # se acc == n allora il numero e` perfetto
end
 
# cerco i numeri perfetti tra 1 e 10000
(1..10000).each do |n|
  puts n if is_perfect?(n)
end