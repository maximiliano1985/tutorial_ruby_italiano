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

require 'pp'

#
# Programma che legge un numero da terminale e costruisce una struttura
# ad albero dei divisori.
# Una volta costruita la stuttura scrive l'albero risultante in un file .dot
# per visualizzarlo graficamente.
#

#
# La struttura data è una combinazione di Hash e Array fatta in questo modo
#
# Un modo dell'albero è una hash con 2 campi:
#  :number    --> un intero
#  :divisors  --> un Array di Hash con i divisori
#
# La funzione divisori costruisce ricorsivamente la struttura dati
#
def divisiori( n )
  root = { :number => n, :divisors => [] }
  #
  # la ricorsione o meglio root è srruttura completa se `n` è un numero primo
  # cioè non ha divisori. La prima cosa fare è calcolare i divisori
  for i in 2..n/2
    if n % i == 0 then
      # se arrivo qui, i è un divisore del numero n
      root[:divisors] << divisiori( i ) ; # divisori(i) restituisce la Hash del
                                          # "sottoalbero" del divisore i
    end
  end
  return root ;
end

#
# to_dot e' una funzione che data la struttura dati dell' albero dei
# divisori stampa una descrizione nel liguaggio "dot" di graphviz
# dell'albero corrispondente
#
def to_dot( albero )
  from = albero[:number] ; # numero di partenza del rampo dell'albero
  albero[:divisors].each { |d|
    to = d[:number] ;
    # stanpo il ramo from --> to
    puts "#{from} -> #{to};"
    to_dot( d ) ;
  }
end

#
# input come linea di comando.
# se il comando è 
#   ruby divisori.rb 100
# ARGV[1] contiene 100

albero = divisiori( ARGV[0].to_i ) ;

puts "digraph G {"
to_dot(albero)
puts "}"
#pp albero

