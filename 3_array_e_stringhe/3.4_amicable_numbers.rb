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
#  Copyright (c) 2014 Universita` di Trento. Tutti i diritti riservati.   #
#-------------------------------------------------------------------------#

=begin
 
Calcola le coppie di numeri amicabili minori di `10000`
 
Una coppia di numeri interi sono detti amicabili se la somma dei 
divisori di primo (escluso se stesso) e` uguale al secondo e viceversa.
 
=end
 
nmax = 10000
 
#____________________________
def divisor_sum(n)
  # accumulo i divisori
  acc = 1 # 1 e` sicurmente divisore
  for i in 2..n/2 do # se i > n/2 di sicuro non divide n
    acc += i if (n%i) == 0 # accumulo i divisori
  end
  return acc
end
 
divisor_table = Array.new(nmax+1) ;
 
puts "costruisco tabella dei divisori"
(1..nmax).each { |n| divisor_table[n] = divisor_sum(n) ; }
 
puts "cerco numeri amicabilie perfetti"
(1..nmax).each do |n|
  m = divisor_table[n] ; # da n a m somma dei suoi divisori
  if m == n then
    puts "#{n} numero perfetto"   
  elsif m <= nmax then
    n1 = divisor_table[m] ; # n1 e` somma dei divisori di m
    # se n=n1 allora n e` somma dei divisori di m e viceversa
    puts "#{n} -- #{m}  amicabili" if n == n1
  end
end