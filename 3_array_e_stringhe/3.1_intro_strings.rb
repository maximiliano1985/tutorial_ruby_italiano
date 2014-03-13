#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: 3.1_intro_strings.rb
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


str = "Ciao mondo!"
puts str
 
# stringhe interpolate e non
str_ni = 'questa e` \n una stringa \t non interpolata'
puts str_ni
p str_ni # una stampa piu` completa
# p str_ni equivale a puts str_ni.inspect
puts str_ni.inspect
puts ""
str_i = "questa e` \n una stringa \t interpolata"
puts str_i
 
 
# interpolare variabili nelle stringhe
eta  = 5
nome = 'rex'
str_ni = 'il mio cane #{nome} ha #{eta} anni (non interpolata)'
str_ni = "il mio cane #{nome} ha #{eta} anni (si interpolata)"
puts ""
 
# concatenare stringhe
str = 'ora'
puts str
str += ' concateniamo' # equivale a str = str + ' sono'
puts str
str << " le"
puts str
str.concat " stringhe"
puts str
puts ""
 
# il punto esclamativo: alcune funzioni sono disponibili ANCHE 
# nella forma con il punto esclamativo finale. 
# In tal caso, le operazioni effettuate sulla variabile sono
# applicate direttamente su essa. 
# Convertiamo una stringa da minuscolo a maiuscolo
str = "convertimi a maiuscolo"
puts "str.upcase #{str.upcase}"
puts "str #{str}" # str e` minuscola
 
puts "str.upcase! #{str.upcase!}"
puts "str #{str}" # str e` maiuscola
puts ""
# NOTA: per vedere le funzioni di default che e` possibile 
# usare con le stringhe e` possibile digitare nell'irb: puts String.methods.sort
 
# ripetere una stringa
str = "ciao "*5
puts str
puts "\n"*2