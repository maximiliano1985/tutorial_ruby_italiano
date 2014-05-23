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


=begin
Implementare una funzione esterna 'eulero_avanti'.  Consideriamo la ODE
      y′ = f(x,y),
il metodo di Eulero esplicito prende la forma: yk+1 = yk +h*f(xk,yk)

La funzione 'eulero_avanti' deve avere la seguente definizione:
  eulero_avanti(x0, x1, y0, npts,  &blocco)
  # x0    : numero che rappresenta l'inizio dell'intervallo di integrazione
  # x1    : numero che rappresenta la fine dell'intervallo di integrazione
  # y0    : numero che rappresenta la condizione iniziale
  # npts  : numero di punti nell'intervallo di integrazione
  # blocco: funzione (i.e. blocco) di due argomenti 'f(x,y)'

La funzione 'eulero_avanti' deve restituire una hash con due chiavi:
  :x => array con le ascisse dei punti di integrazione (punti dell'intervallo di
        integrazione)
  :y => array con il valore dell'integrale per ogni 'x'.

INCLUDERE LA GESTIONE DEGLI ERRORI SULLE VARIABILI IN INGRESSO ALLA FUNZIONE.


Note:
La funzione 'eulero_avanti' puo' essere testata sulla ODE:
  y' = - y + 3*x
sapendo che se x0 = 0, x1 = 2, y0 = 1, npts = 10, la soluzione che deve essere
restituita è (a meno di errori numerici):

{:x=>[0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2],
:y=>[1, 0.8, 0.52, 0.176, -0.219, -0.655, -1.124, -1.619, -2.136, -2.668, -3.215]}

Appunti:
  http://www.oa-roma.inaf.it/limongi/HomePage/Labcalc_files/dispense_1.pdf
  http://www.math.pitt.edu/~sussmanm/2071/lab02/lab02.pdf
=end


################################################################################
# RISOLVERE L'ESERCIZIO QUI
################################################################################






################################################################################
# NON MODIFICARE LE LINEE DI CODICE RIPORTATE QUI DI SEGUITO
################################################################################
load "../checker.rb" if __FILE__ == $0