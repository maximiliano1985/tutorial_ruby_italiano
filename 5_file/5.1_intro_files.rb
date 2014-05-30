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
Un File e' un'astrazione di qualsiasi oggetto file accessibile dal programma, ed e' associato con la classe IO File la quale include i metodi del modulo FileTest come metodi di classe, permettendo di scrivere (per esempio) File.exist?("foo")
=end


##########################################
#### CREAZIONE DI UN FILE ################
##########################################
# Posso creare un file mediante il comando:
nomefile = "testfile.txt"

puts "Creazione e scrittura di file di testo"
file = File.open( nomefile, "r+")
# Nota: "w" e' usato per scrivere il file (eventualmente creandolo se non
#           esiste già)
#       "r" e' usato per leggere il file
#       "r+" sia per leggere che per leggere il file
#       "a" per aggiungere linee alla fine del file

# Ci aggiungo stringhe in questo modo
file.puts "Questa e' una prova"

ary = [123456.654321, 22222.1111, -42421.123]
file.puts "123.4\tciao\t#{ary}"


# E alla fine devo sempre ricordarmi di chiudere il file!
# Così mi assicuro che tutti i dati bufferizzati sono scritti e che rilascio tutte le risorse computazionali utilizzate.
file.close


##########################################
#### LETTURA DA FILE #####################
##########################################
puts "\nPrimo metodo per leggere i file"
# In alternativa, Ruby mi permette di fare tutto con un unico comando, un unico BLOCCO. Questa funzione si chiama 'open', ed invece di restituirmi un nuovo 'oggetto' File richiama il blocco definito, passandoci come argomento il nuovo file aperto.
File.open(nomefile, "r") do |file|
  file.each do |line|
    puts line
  end
end

# Questa seconda opzione ha pro e contro:
# pro: se sbaglio a programmare ed il mio codice da un errore mentre scrivo il file, EVITO DI TENERE IL FILE APERTO (non ho bisogno di chiamare il '.close')
# contro: e' una notazione meno flessibile e devo tenere le operazioni che effettuo sul file in righe di codice tra loro vicine.

puts "\nSecondo metodo per leggere i file"
# In alternativa, per leggere il file posso usare:
File.open(nomefile, "r") do |file|
  while line = file.gets
    puts line
  end
end


puts "\nTerzo metodo per leggere i file"
# Se combino l'idea dell'iteratore nel file, con il secondo metodo di lettura dei file, posso usare 'IO.foreach':
IO.foreach(nomefile){ |line| puts line }

