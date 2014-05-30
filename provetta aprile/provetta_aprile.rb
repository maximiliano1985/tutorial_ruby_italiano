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


# LEGGERE ATTENTAMENTE LE SEGUENTI ISTRUZIONI
# - Associare il proprio cognome, nome e numero di matricola nelle sottostanti
#   variabili globali.

Cognome   = "Rossi"
Nome      = "Pippo"
Matricola = 123456

# inizializzazione hash provetta dove mettere i risultati
# il dollaro davanti al nome ci va e serve per rendere $provetta
# una variabile globale
$provetta = {}


# ESEGUIRE GLI ESERCIZI RIPORTATI IN QUESTO SCRIPT.
# - Alla fine di ogni esercizio e' possibile verificare se questo e' stato svolto
#   correttamente, eseguendo questo script Ruby, passandoci come argomento il
#   numero dell'esercizio da corregere.
#
#   E.g. per l'esercizio 1: $ ruby provetta_aprile.rb 1  
#


################################################################################
# 1. Caricare il file di testo 'versione_latina.txt' e salvare ogni paragrafo 
#    nell'array puntato dalla chiave ':testo' della hash '$provetta' (fare 
#    attenzione ad utilizzare il nome corretto). Eliminare il terminatore di
#    linea dalla stringa.
#
#    RISULTATO:
#    $provetta[:testo] deve contenere un array di stringhe!
#





################################################################################
# 2.a) Contare quante parole ci sono nel testo (tralasciando i terminatori di 
#      linea), e salvare il risultato nella chiave ':n_parole' della hash 
#      $provetta'. Ogni parola deve essere scritta in minuscolo (downcase).
# 2.b) Salvare ogni parola nella chiave ':parole' della hash '$provetta'.
#
#    RISULTATO:
#    $provetta[:n_parole] deve contenere un intero con il numero di parole trovate
#    $provetta[:parole]   deve contenere un array di stringhe con le parole trovate (con ripetizione)
#







################################################################################
# 3) Trovare qual'e' la parola più frequente nel testo e associarla alla chiave
#     ':parola_frequente' della hash $provetta'. Salvare nella chiave
#     ":n_parola_frequente" quante volte tale parola e' ripetuta.
# Suggerimento: creare una hash temporanea dove ogni chiave e' la parola trovata
# nel testo ed il valore a cui essa punta e' il numero di volte che viene usata.
# Sarà poi sufficiente ordinare la hash per ottenere la parola chiave, a cui
# punta il valore più alto.
#
#    RISULTATO:
#    $provetta[:parola_frequente]    stringa con la parola piu usata
#    $provetta[:n_parola_frequente]  quante volte la parola compare nel testo





################################################################################
# 4) Creare un dizionario del testo, ovvero estrarre tutte le parole dal testo 
#    senza ripetizioni. Il risultato deve essere un Array associato alla chiave
#    :dizionario della hash '$provetta'.
#
#    RISULTATO:
#    $provetta[:dizionario] array di stringhe con le parole (senza ripetizione)
#






################################################################################
# NON MODIFICARE LE LINEE DI CODICE QUI RIPORTATE
################################################################################
if __FILE__ == $0
  load "checker.rb"
end