#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: ex2.6_crivello_erastotene.rb
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

#
# Programma crivello di Eratostene per 
# la ricerca dei numeri primi
#
n = ARGV[0].to_i # leggo da linea di comando n
n = 2 if n < 2   # trucchetto per evitare n < 1
 
# alloco vettore con n+1 elementi
okprime = Array.new(n+1)
 
# riempio vettore con booleani = true
for i in (0..n) do
  okprime[i] = true
end
 
k = 2 ; # parto con 2 e` numero primo
while k < n do
  # elimino tutti i multipli di k come numeri primi
  i = 2
  while i*k <= n do
    okprime[i*k] = false
    i = i+1 ;
  end
  # cerco prossimo numero primo
  k = k+1 ;
  while (k < n) and not okprime[k] do
    k = k+1
  end
end
#
# stampo numeri primi
#
for i in (0..n) do
  puts "#{i}" if okprime[i]
end