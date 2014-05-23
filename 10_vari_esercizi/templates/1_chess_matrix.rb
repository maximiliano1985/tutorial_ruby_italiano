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

Nome      = 'Valentino'
Cognome   = "Rossi"
Matricola = 123456


=begin
  Generare una matrice NxM (N righe e M colonne) riempita a scacchiera con
  asterischi '*' e spazi bianchi, e nella quale il primo elemento in posizione
  (1,1) sia un asterisco.
  La matrice deve essere salvata in una variabile che si chiama '$chess_matrix'.
  La matrice deve essere rappresentata come un Array di Array nel quale
  ogni elemento può essere un asterisco o uno spazio bianco.
  E.g. ['*', ' ', '*', ' ', ...]
=end

N = 10
M = 5


################################################################################
# RISOLVERE L'ESERCIZIO QUI
################################################################################





################################################################################
# NON MODIFICARE LE LINEE DI CODICE RIPORTATE QUI DI SEGUITO
################################################################################
load "../checker.rb" if __FILE__ == $0