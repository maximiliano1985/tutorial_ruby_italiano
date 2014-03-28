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
In questa lezione vediamo una introduzione alla programmazione ad oggetti,
punto di forza dei moderni linguaggi di programmazione, come C++, Python,
Java, e Ruby.
UN OGGETTO E' UNA ISTANZA DI UNA CLASSE.
Vediamo quindi brevemente cos'è una classe, e cosa vuol dire istanziare una
classe per creare un oggetto.
=end

=begin
CLASSI:
  una classe è un tipo di dato, definito da:
   - attributi: variabili/costanti che definiscono le proprietà degli oggetti 
   - metodi: funzioni interne, che posso essere applicate agli attributi, ma
             anche a variabili esterne alla classe
  Nelle lezioni successive vedremo che classi diverse possono essere messe in
  relazione attraverso la relazione di EREDITARIETA'. Ereditare una classe
  significa creare nuove classi partendo da classi pre-esistenti ed
  estendendole con caratteristiche aggiuntive.

  N.B.: IN RUBY quasi TUTTO E' UN OGGETTO. Ogni valore booleano, intero, float,
  stringa, array, hash, struct, e classe sono FIGLI (i.e. ereditano) da altre
  classi, che a loro volta ereditano dalla classe 'Class'. Posso verificare 
  ciò invocando il metodo 'class':
=end
s = 'ciao'
puts "s è una classe #{s.class}"
puts "#{s.class} è una classe #{s.class.class}"
puts "\n"*3

=begin
OGGETTI:
  abbiamo detto che un oggetto è una istanza di una classe. Istanziare
  significa allocare della memoria per l'oggetto, e inizializzare la classe.
  Per inizializzare una classe è necessario invocare il suo metodo
   costruttore, che in Ruby si chiama 'new'. Ad esempio, data una classe
  'Cane', creerò l'oggetto 'fido' con il seguente comando:
      fido = Cane.new
=end

=begin
ESEMPIO:
  definiamo una classe e creiamo un oggetto istanziandola. Suppongo di
  voler creare un Juke Box con le informazioni delle mie canzoni preferite.
  Ogni canzone sarà una classe

Nota: ' buona norma dare i nomi alle classi con la prima lettera maiuscola.
  Se il nome della mia classe è composto da più parole adotterò la 'CamelCase'
  notation (e.g. 'ClasseDiProva')
=end
class Canzone
  # 1) 'initialize' è in nome del metodo COSTRUTTORE, che verrà invocato quando
  # istanzio la classe. In questo caso il costruttore ha tre argomenti:
  #   nome (Stringa) della canzone
  #   artista (Stringa) nome del cantante
  #   durata  (Float) durata –in secondi– del brano
  def initialize(nome, artista, durata)
    # Le variabili che iniziano con la chiocciolina @ e sono definite dentro
    # alla classe sono chiamate VARIABILI DI ISTANZA. Queste rappresentano gli
    # ATTRIBUTI della mia classe, e sono definite (i.e. hanno un valore diverso
    # da 'nil') solo allorquando la classe sia stata istanziata.
    # Lo SCOPE degli attributi è tutto a classe.
    ### Per inizializzare la mia classe canzone farò:
    ### c1 = Song.new('Arabella', 'Arctic Monkeys', 207)
    @nome    = nome
    @artista = artista
    @durata  = durata
  end
end

# Per inizializzare la mia classe canzone farò:
c1 = Canzone.new('Arabella', 'Arctic Monkeys', 207)
puts c1.inspect




class Canzone
  # 2) Al momento la mia classe ha un costruttore che gli ho definito io, ma
  #    anche tutte le funzioni della classe da cui eredita. Abbiamo detto che
  #    in Ruby ogni classe eredita dalla classe 'Class', infatti:
  #       c1.class.class -> Class
  #    Ho quindi ereditato tutti i metodi di 'Class', che elenco con:
  #       puts Class.methods.sort
  #
  #    Ad esempio vedo che ho il metodo 'inspect', che mi da una descrizione
  #    della mia istanza. Tuttavia l'output del metodo non è molto leggibile, 
  #    quindi posso sovrascrivere questo metodo.
  def inspect
    # Nota: per interpolare variabili di istanza in una stringa posso scrivere:
    #    "#{@nome}"   oppure   "#@nome"
    return "Canzone: #@nome -- #@artista : #@durata"
  end
end
puts "> Nuovo inspect:"
puts c1.inspect


# 3) Accessori: come posso fare a leggere il nome della mia canzone? Potrei 
#    pensare di scrivere:
#     puts c1.nome
# ma Ruby mi dirà che in metodo 'nome' non è stato definito per la mia classe
# c1. Devo quindi definire dei metodi che mi permettano di leggere, ed in caso
# scrivere, gli attributi (i.e. le variabili di istanza) del mio oggetto.
# Questo lo posso fare con due metodi:
class Canzone
  
  # 3.1) definisco esplicitamente i metodi accessori...
  # per leggere il nome:
  #   def nome
  #     return @nome
  #   end
  # per scrivere il nome:
  #   def nome=(nuovo_nome)
  #     @nome = nuovo_nome
  #   end
  
  # 3.2) oppure posso creare degli accessori attraverso delle scorciatoie:
  #    attr_reader :nome
  #    attr_writer :nome
  # quando sono interessato sia all'accessore per la lettura che a quello per la scrittura posso scrivere direttamente:
  attr_accessor :nome, :artista, :durata
end

puts c1.nome
c1.nome = "R U mine?"
puts c1.nome




