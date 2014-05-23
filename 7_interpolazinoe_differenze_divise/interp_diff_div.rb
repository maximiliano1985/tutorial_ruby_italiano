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


# Interpolatore mediante Differenze Divise
class InterpDD
  attr_reader :dd
  
  def initialize(hsh = {})
    unless hsh[:x].nil?
      @x = hsh[:x]
      @y = hsh[:y]
    else
      @x = []
      @y = []
    end
    @dd = [] # differenze finite
  end
  
  
  def aggiungi_punto(x,y)
    @x << x
    @y << y
  end
  
  def rimuovi_ultimo_punto
    ultimo_punto = [@x.pop, @y.pop]
    return ultimo_punto
  end
  
  def grado
    return @y.size-1
  end
  
  # sfrutto lo schema delle differenze divise, ma faccio una funzione ricorsiva
  def costruisci_polinomio
    n = grado
    t = []
    for i in 0 .. n do
      t[i] = @y[i]
      j = i-1
      while j >= 0
        t[j] = (t[j+1] - t[j]) / (@x[i] - @x[j])
        j -= 1
      end
      @dd[i] = t[0]
    end
  end
  
  # Valuto il polinomio ricorsivamente, con lo schema di Horner
  # (libro: Introduction to Numerical Analysis, pag. 44)
  def valuta(x)
    i = grado #@dd.size - 1
    y = @dd.last 
    while i > 0
      i -= 1
      y = y*(x - @x[i]) + @dd[i]
    end
    return y
  end
  
  def inspect
    
  end
end


if __FILE__ == $0

  data = {
    :x => [0,1,2,3,4],
    :y => [0,1,4,9,16]
  }
  interp = InterpDD.new data
  interp.costruisci_polinomio
  
  num = 2
  puts "P(#{num}) = #{interp.valuta(num)}"
  puts "Grado polinomio #{interp.grado}"
  puts "Diff. divise #{interp.dd}"
end