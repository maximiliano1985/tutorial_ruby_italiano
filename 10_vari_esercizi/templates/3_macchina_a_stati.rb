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
  Implementare in una classe una macchina a stati che rappresenti un distributore
  di bevande e che rispetti la seguente tabella di transizioni:

        stato corrente  |           |           |         |         |
  Input                 |  idle     | selezione | informa | prepara | reset
--------------------------------------------------------------------------------
'm'oneta                | selezione |   -----   |  -----  |  -----  | -----
--------------------------------------------------------------------------------
's'elezione             |  informa  |  prepara  |  -----  |  -----  | -----
--------------------------------------------------------------------------------
'a'bortire              |   -----   |   reset   |  -----  |  reset  | -----
--------------------------------------------------------------------------------
Transizione naturale    |   idle    |   -----   |  idle   |  idle   | idle


  La macchina a stati deve essere una istanza della classe -Machine- e all'inizio
  si trova nello stato -idle-. Tale classe deve avere almeno i seguenti metodi:
  - initialize:  inizializza la macchina a stati
      ingresso: nessuno
        uscita: nessuna
  - leggi_input: evolve lo stato della macchina a stati a seguito di un determinato
                ingresso.
       ingresso: un carattere tra 'a', 's', 'm'
         uscita: un array di simboli con i nomi degli stati su cui la macchina ha 
                 ciclato a seguito dell'ingresso ricevuto. I nomi degli stati
                 devono rispettare quelli della tabella di transizioni e sono
                 rappresentati da simboli.
                 N.B.: GLI STATI DEVONO ESSERE RAPPRESENTATI DA SIMBOLI SCRITTI
                       CON LETTERE MINUSCOLE
  - stato_corrente: comunica lo stato corrente della macchina a stati
       ingresso: nessuno
         uscita: il nome dello stato corrente nel quale si trova la macchina a stati

  La classe Machine sara' così utilizzata:
%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%
mach = Machine.new
# Inserisco la moneta
input = 'm'
puts "> Input #{input}"
puts "stati attraversati: #{mach.leggi_input(input)}"
# Seleziono bevanda 's'
input = 's'
puts "> Input #{input}"
puts "stati attraversati : #{mach.leggi_input(input)}"

# Inserisco la moneta
input = 'm'
puts "> Input #{input}"
puts "stati attraversati : #{mach.leggi_input(input)}"
# Annullo la selezione
input = 'a'
puts "> Input #{input}"
puts "stati attraversati : #{mach.leggi_input(input)}"
%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%
  
  Al fine di rendere il distributore di bevande user-friendly, si suggerisce di
  stampare informazioni su: ingresso in uno specifico stato, azioni eseguite al
  suo interno, e uscita da esso.

N.B.: INCLUDERE LA GESTIONE DEGLI ERRORI ED IL CONTROLLO SUGLI INGRESSI DI OGNI 
  FUNZIONE.
=end



################################################################################
# RISOLVERE L'ESERCIZIO QUI
################################################################################





################################################################################
# NON MODIFICARE LE LINEE DI CODICE RIPORTATE QUI DI SEGUITO
################################################################################
load "../checker.rb" if __FILE__ == $0