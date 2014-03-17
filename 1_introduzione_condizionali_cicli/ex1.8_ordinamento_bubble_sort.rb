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

# Ottavo esempio, semplice ordinamento con Bubble-Sort

#
# Esempio ordinamento di un vettore
#
# inizializza vettore
a = [1,-2,3,189,-23,2,34,46,343,12] ;
# preparazione
l = a.length
i = 0
while i < l-1 do
  imin = i # candidato minimo=primo elemento del sottovettore
  j = i+1
  while j < l do
    imin = j if a[j] < a[imin]
    j = j+1
  end
  # a[imin] e` minimo del sottovettore da i fino ultimo elemento
  # scambio a[imin] con a[i]
  c       = a[i]
  a[i]    = a[imin]
  a[imin] = c
  i       = i+1
end
puts "Il vettore ordinato e` #{a}"
