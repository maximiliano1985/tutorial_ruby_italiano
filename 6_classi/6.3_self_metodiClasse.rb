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
 Vedremo ora cos'è in ruby la parola chiave 'self'. Quando usata all'interno
 di una classe, la parola 'self' è utilizzata per riferirsi all'oggetto (i.e.
 istanza) corrente.

 Vedremo inolte cosa sono i metodi e le variabili di classe
=end


class Item1
  
  # metodo di istanza. E' creato solo dopo che ho instanziato la classe
  def initialize(item_nome)
    @item_nome = item_nome
  end
  
  # metodo di istanza
  def show
    # 'self' mi restituisce la rappresentazione dell'istanza dell'oggetto
    puts "Metodo di istanza 'show' invocato per #{self}"
  end  
 
  # se voglio una rappresentazione più leggibile
  #def to_s
  #  "Item: #{@item_nome}"
  #end
  
end

t = Item1.new('test')
t.show


############################################
#### METODI DI CLASSE ######################
############################################
puts "_"*40
class Item2
  # aggiungendo un 'self' al nome del metodo creo un metodo di classe. Questo 
  # metodo esiste anche senza instanziare la classe
  def self.show_class
    puts "Invocato metodo di classe"
  end
  
  def show_instance
    puts "Metodo di istanza"
    #puts "La variabile di instanza vale #{@var_instance}"
  end
end
Item2.show_class # ora uso il metodo 'show' senza istanziare la classe
#Item2.show_var_instance # da errore perchè la classe non è stata inizializzata

# in alternativa avrei potuto scrivere
=begin
class Item2
  class << self
    def show
      puts "Invocato metodo di classe"
    end
  end
end
=end


#====#====#====#====#====#====#====#====#====#====#====#====#====#====#====#
#N.B. I metodi di classe non hanno accesso ai metodi di istanza, o alle variabili di istanza. Al contrario, metodi di istanza possono accedere alle variabili ed ai metodi di classe. Verifichiamo la prima affermazione:
#====#====#====#====#====#====#====#====#====#====#====#====#====#====#====#
puts "_"*40
class Item3
  # aggiungendo un 'self' al nome del metodo creo un metodo di classe. Questo 
  # metodo esiste anche senza instanziare la classe
  def self.show_class
    #show_instance   # questo da errore
    puts "@var_instanza = #{@var_instanza}" # questo da 'nil'
    puts "Invocato metodo di classe"
  end
  
  def show_instance
    @var_instanza = 3
    puts "Metodo di istanza"
    #puts "La variabile di instanza vale #{@var_instance}"
  end
end
Item3.show_class



############################################
#### VARIABILI DI CLASSE ###################
############################################
puts "_"*40
class Pianeta
  # le variabili di classe si definiscono con due '@'
  @@numero_pianeti = 0
  
  def initialize(name)
    @name = name
    @@numero_pianeti += 1
  end
  
  # definisco un metodo di classe che mi permette di accedere alla variabile di istanza numero_pianeti
  def self.numero_pianeti
    @@numero_pianeti
  end  
end

Pianeta.new("earth")
Pianeta.new("uranus")
puts "Il mio sistema planetario ha #{Pianeta.numero_pianeti} pianeti"
# le variabili di classe possono essere usate per salvare dati che appartengono
# a una classe, ma non ad una istanza.





############################################
#### VARIABILI DI ISTANZA DI CLASSE ########
############################################
class Foo
  # N.B: una variabile nominata con un solo '@' e definita nel corpo della 
  # classe si chiama VARIABILE DI ISTANZA DI CLASSE
  @contatore_inst_class = 0
  
  @@contatore_class = 20
  
  def aumenta_cont_inst_class # questo metodo darà errore!
    @contatore_inst_class += 1
  end
  
  def aumenta_cont_class
    # questo metodo FUNZIONA perchè POSSO USARE VARIABILI (ma anche metodi)
    # DI CLASSE NEI METODI di istanza
    @@contatore_class += 1
  end
  
  def self.increment_counter
    @contatore_inst_class += 1
  end
  
  def self.current_count_inst_class
    @contatore_inst_class
  end  
  
  def self.curret_count_cl
    @@contatore_class
  end
end

puts Foo.increment_counter # OK, funziona

f = Foo.new
#puts f.aumenta_cont_inst_class
puts "f.aumenta_cont_class #{f.aumenta_cont_class}"
# questo da errore perchè NON POSSO USARE VARIABILI DI
#  ISTANZA DI CLASSE NEI METODI DI ISTANZA



# e che differenza c'è tra '@@contatore_class' e '@contatore_inst_class'? Vediamolo...
class Bar < Foo
  @contatore_inst_class = 100 # se non la definisco, vale 'nil', il suo valore non è ereditato
  @@foo_var_cl = 140 # questo NON VIENE SOVRASCRITTO!!!
end
puts "Variabile @contatore_inst_class in Foo #{Foo.current_count_inst_class}"
puts "Variabile @contatore_inst_class in Bar #{Bar.current_count_inst_class}"

puts "Variabile @@contatore_class in Foo #{Foo.curret_count_cl}"
puts "Variabile @@contatore_class in Bar #{Bar.curret_count_cl}"

=begin RIASSUMENDO

A) I metodi di classe non hanno accesso ai metodi di istanza, o alle variabili di istanza. Al contrario, metodi di istanza possono accedere alle variabili ed ai metodi di classe.

B) Le variabili di istanza sono disponibili solo per istanze di classi, e si scrivono come '@foo'. Le variabili di classe invece sono disponibili sia per i metodi di classe che per i metodi di istanza, e si scrivono come '@@foo'.

C) Le variabili di istanza di classe si scrivono come le variabili di istanza ('@foo') ma vanno dichiarate nel corpo della classe e hanno proprietà molto diverse dalle variabili di istanza.

D) Le differenze tra VARIABILI DI CLASSE e VARIABILI DI ISTANZA DI CLASSE sono:

  1) le variabili di istanza di classe NON PERMETTONO LA CONDIVISIONE DI DATI ATTRAVERSO TUTTA LA CATENA DI EREDITARIETÀ (cosa che invece fanno le variabili di classe).

  2) le variabili di istanza di classe possono essere USATE SOLO IN METODI DI CLASSE
=end





