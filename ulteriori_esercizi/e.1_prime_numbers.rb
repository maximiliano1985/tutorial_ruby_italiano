#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: e.1_prime_numbers.rb
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

1.A Given a number, tell whether it is prime

Background: prime numbers are those number greater than 1 and divisible only for 1 and themselves. Use the Eratosthenes' Method

=end

number = 7 # tested number

#____________________________
# EXTENDED WAY
#____________________________
is_prime = true
for i in 2..(number-1)
  remainder = number % i # get the remainder of the division

  if remainder == 0 # check if the iterator 'i' is a divisor of 'number'
    is_prime = false
    break
  end
end

if is_prime == true
  puts "the number is prime"
else
  puts "the number is NOT prime"
end

# TODO: add handling for 'number = 0' and 'number = 1' which are not prime numbers
# TODO: do the loop using a 'while' instead of a 'for'


##____________________________
## COMPACT WAY
##____________________________
is_prime = true

for i in 2..(number-1)
  is_prime = false if (number % i) == 0 # check if the iterator 'i' is a divisor of 'number'
  break unless is_prime
end

if is_prime
  puts "the number is prime"
else
  puts "the number is NOT prime"
end