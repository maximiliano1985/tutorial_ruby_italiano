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

#ary = [11,22,33,44,55]
#ary.each do |el|
#  puts el
#end
#
#ary.each{|el| puts el }

class Array
  def ogni() # each
    puts "2. Entrato nella funzione ogni"
    for i in 0...self.size
      puts "3. Inizio chiamata blocco"
      yield(self[i])
      yield(i)
      puts "4. Fine chiamata blocco"
    end
    puts "5. Uscita dalla funzione ogni"
  end
  
  def ogni_con_indice() # each_with_index
    for i in 0...self.size
      yield(self[i], i)
    end
  end
end

module ValutaOperazioni
  def self.sqrt(x)
    return Math::sqrt(x)
  end
  
  def self.pow2(x)
    return x*x
  end
end



module StampaOperazioni
  def self.sqrt(x)
    puts Math::sqrt(x)
  end
  
  def self.pow2(x)
    puts x*x
  end
end



bary = ['11','22','33','44']
#puts "1. Definito array bary"
#bary.ogni do |el|
#  puts el
#end
#puts "6. Uscita dal programma"
bary.ogni_con_indice do |el, indx|
  res = StampaOperazioni::pow2( el.to_f )
  puts "#{el} -> #{res.inspect}"
end



