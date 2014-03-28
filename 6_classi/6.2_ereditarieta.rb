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
Nell'esempio precedente abbiamo visto cos'è una classe, un oggetto, ed abbiamo
parlato brevemente di cos'è l'ereditarietà. In questo esempio tratteremo l'ereditarietà in modo più completo
=end

# Definisco la classe Canzone con il metodo costruttore, inspect, e gli 
# accessori
class Canzone
  # accessori
  attr_accessor :nome, :artista, :durata
  
  # Costruttore
  def initialize(nome, artista, durata)
    @nome    = nome
    @artista = artista
    @durata  = durata
  end
  
  def inspect
    return "Canzone: #@nome -- #@artista : #@durata"
  end
end

# L'ereditarietà mi permette di creare una classe che è una specializzazione di
# un'altra classe. Ad esempio, creo una classe 'CanzoneKaraoke' è deve essere 
# come la classe 'Canzone', con l'unica differenza che deve avere anche 
# informazioni sul testo della canzone. Devo quindi modificare soltanto il costruttore della classe
class CanzoneKaraoke < Canzone
  attr_reader :testo
  
  def initialize(nome, artista, durata, testo)
    # il metodo 'super' messo qui richiama il costruttore di 'Canzone'
    super(nome, artista, durata)
    @testo = testo
  end
end

# Proviamo ora la nostra classe 'CanzoneKaraoke'
# carico il testo della canzone da un file
testo = ""
IO.foreach('testi/cigarette_smoke.txt'){|line| testo << line}

k1 = CanzoneKaraoke.new('cigarette smoke', 'Arctic Monkeys', 176, testo)
# visualizziamo le informazioni sulla canzone:
puts k1.inspect
# mi restituisce: > Canzone: cigarette smoke -- Arctic Monkeys : 176
# che è proprio l'output che avevo definito nella classe 'Canzone', ovviemente 
# senza informazioni sul testo. Modifico quindi il metodo 'inspect' di
# 'CanzoneKaraoke'
class CanzoneKaraoke < Canzone
  def inspect
    # 'super' in questo caso dice a Ruby di invocare il metodo 'initialize' di 
    # 'Canzone'
    descrizione = super
    return descrizione + " [ #{@testo[0..20]} ... ]"
  end
end
puts k1.inspect



