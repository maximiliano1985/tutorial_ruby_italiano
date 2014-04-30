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
# 1. Associare il proprio nome, cognome e numero di matricola nelle sottostanti
# variabili globali.

Nome      = "A"
Cognome   = "b"
Matricola = 123456


# 2. ESEGUIRE GLI ESERCIZI RIPORTATI IN QUESTO SCRIPT.
# Alla fine di ogni esercizio è possibile verificare se questo è stato svolto 
# correttamente, eseguendo questo script Ruby, passandoci come argomento il 
# numero dell'esercizio da corregere.
#
#   E.g. per l'esercizio 1: $ ruby provetta_aprile.rb 1  
#



# 1. Caricare il file di testo 'versione_latina.txt' e salvare ogni paragrafo 
#    nell'array puntato dalla chiave ':testo' della hash '$provetta' (fare 
#    attenzione ad utilizzare il nome corretto). Eliminare il terminatore di
#    linea dalla stringa.

filename = "versione_latina.txt"
  
$provetta = {:testo => []}
IO.foreach(filename) do |l|
  l.chomp!
  $provetta[:testo] << l unless l.empty?
end






# 2.a) Contare quante parole ci sono nel testo (tralasciando i terminatori di 
#      linea), e salvare il risultato nella chiave ':n_parole' della hash 
#      $provetta'. Ogni parola deve essere scritta in minuscolo (downcase).
#      Vanno considerate tutte le parole, anche se ripetute.
# 2.b) Salvare ogni parola nella chiave ':parole' della hash '$provetta'.

$provetta[:parole] = []
$provetta[:testo].each do |paragr|
  parole = paragr.split " "
  parole.each{|p| $provetta[:parole] << p.downcase}
end
$provetta[:n_parole] = $provetta[:parole].size






# 3) Trovare qual'è la parola più frequente nel testo e associarla alla chiave
#     ':parola_frequente' della hash $provetta'. Salvare nella chiave
#     ":n_parola_frequente" quante volte tale parola è ripetuta.
# Suggerimento: creare una hash temporanea dove ogni chiave è la parola trovata
# nel testo ed il valore a cui essa punta è il numero di volte che viene usata.
# Sarà poi sufficiente ordinare la hash per ottenere la parola chiave, a cui
# punta il valore più alto.

hsh = {}
$provetta[:parole].each do |par|
  if hsh.has_key? par
    hsh[par] += 1
  else
    hsh[par] = 1
  end
end
vec_ord = hsh.sort{|x, y| y.last <=> x.last}
$provetta[:parola_frequente] = vec_ord.first.first
$provetta[:n_parola_frequente] = vec_ord.first.last






# 4) Creare un dizionario del testo, ovvero estrarre tutte le parole dal testo 
#    senza ripetizioni. Il risultato deve essere un Array associato alla chiave
#    :dizionario della hash '$provetta'.
$provetta[:dizionario] = $provetta[:parole].uniq






################################################################################
# NON MODIFICARE LE LINEE DI CODICE QUI RIPORTATE
################################################################################
if __FILE__ == $0
  load "checker.rb"
end