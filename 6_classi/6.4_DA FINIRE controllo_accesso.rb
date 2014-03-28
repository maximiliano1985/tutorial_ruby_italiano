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
Quando si lavora con le classi, tutti i metodi sono PUBBLICI di default, ovvero accessibili fuori dalla classe. Ci possono tuttavia essere funzioni a cui è opportuno limitare l'accesso. Distinguiamo quindi tra metodi:
   - pubblici: accessibili da chiunque
   - protetti: possono essere richiamati solo all'interno della classe stessa, ma anche nelle classi figlie.
   - privati: possono essere richiamati solo all'interno della classe stessa
=end




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
    ms = durata_in_millisecondi
    #converti_maiuscolo
    return "Canzone: #@nome -- #@artista : #@durata s"
  end
  
  ## aggiungo un metodo protetto
  protected
  def durata_in_millisecondi
    @durata*1000
  end
  
  # qui posso aggiungere altri metodi protetti
  
  
  ## aggiungo un metodo privato
  private
  def converti_maiuscolo
    @nome.upcase!
    @artista.upcase!
  end
  
  # qui posso aggiungere altri metodi privati
  
end



class CanzoneKaraoke < Canzone
  attr_reader :testo
  
  def initialize(nome, artista, durata, testo)
    # il metodo 'super' messo qui richiama il costruttore di 'Canzone'
    super(nome, artista, durata)
    @testo = testo
  end
  
  def inspect
    # 'super' in questo caso dice a Ruby di invocare il metodo 'initialize' di 
    # 'Canzone'
    converti_maiuscolo
    
    descrizione = super
    ms = durata_in_millisecondi
    return descrizione + ", ovvero #{ms} millisecondi | [ #{@testo[0..20]} ... ]"
  end
end

testo = ""
IO.foreach('testi/cigarette_smoke.txt'){|line| testo << line}

k1 = CanzoneKaraoke.new('cigarette smoke', 'Arctic Monkeys', 176, testo)
puts k1.inspect

# 'durata_in_millisecondi' è un metodo PROTETTO, quindi è usabile soltanto 
# all'interno la classe 'Canzone' e nei suoi figli (i.e. 'CanzoneKaraoke')
### puts k1.durata_in_millisecondi # da errore






