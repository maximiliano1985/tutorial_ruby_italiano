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

#
# Esempio di integrazione numerica,
# uso della formula dei trapezi per integrare
# x*sin(x) nell'intervallo [1,10]
#

def f(x)
  return x*Math::sin(x)
end

#
# Metodo dei trapezi
# a = estremo sinistro intervallo di integrazione
# b = estremo destro intervallo di integrazione
# n = numero di intervalli
# 
def trapezi( a, b, n )
  h   = (b.to_f-a.to_f)/n.to_f
  res = (f(a)+f(b))/2
  for i in 1...n do
    xi = a+i*h # calcolo nodo di quadratura interno
    res += f(xi) ;
  end
  return res*h
end

# integrale esatto calcolato "a mano"
esatto = Math::sin(10)-10*Math::cos(10)

a = 0
b = 10

n = 10
trap = trapezi(a,b,n)
puts "trapezi(#{a},#{b},#{n}), I = #{trap}, Errore = #{trap-esatto}"

n = 20
trap = trapezi(a,b,n)
puts "trapezi(#{a},#{b},#{n}), I = #{trap}, Errore = #{trap-esatto}"

n = 40
trap = trapezi(a,b,n)
puts "trapezi(#{a},#{b},#{n}), I = #{trap}, Errore = #{trap-esatto}"

n = 80
trap = trapezi(a,b,n)
puts "trapezi(#{a},#{b},#{n}), I = #{trap}, Errore = #{trap-esatto}"

n = 160
trap = trapezi(a,b,n)
puts "trapezi(#{a},#{b},#{n}), I = #{trap}, Errore = #{trap-esatto}"




