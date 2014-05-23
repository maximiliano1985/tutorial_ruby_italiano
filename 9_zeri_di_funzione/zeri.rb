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
class NthRooth
  def initialize( a, n )
    @a = a # numero del quale si vuole la radice quadrata
    @n = n # ordine della radice da calcolare
  end
  
  def f(x)
    return x**@n-@a
  end
  
  def df(x)
    return @n*x**(@n-1)
  end
end  

class SqrtFun < NthRooth
  def initialize( a )
    super(a,2)
  end
end

class ThirdRooth < NthRooth
  def initialize( a )
    super(a,3)
  end
end

#class SqrtFun
#  def initialize( a )
#    @a = a # numero del quale si vuole la radice quadrata
#  end
#  
#  def f(x)
#    return x*x-@a
#  end
#
#  def df(x)
#    return 2*x
#  end
#end

def err_asymptotic( x, alpha )
  for k in 2...x.size do
    ek    = (x[k-2]-alpha).abs
    ekp1  = (x[k-1]-alpha).abs 
    ekp2  = (x[k]  -alpha).abs
    p     = Math::log(ekp1/ekp2)/Math::log(ek/ekp1)
    puts "k = #{k}, order p = #{p}"
  end
end

def newton( x0, tol, iter_max )
  x = [ x0.to_f ] # inizializza iterate
  for k in 1..iter_max do
    fdf = yield(x.last) # blocco calcola f(x) e df(x) e restituisce [f(x),df(x)]
    h = -fdf[0]/fdf[1] # h = - f(x)/df(x)
    break if h.abs < tol # interrompo ciclo se passo 
                         # piu piccolo della tolleranza
    x << x.last+h # x = x + h
  end
  return x
end

def secanti( x0, x1, tol, iter_max )
  x  = [ x0.to_f, x1.to_f ] # inizializza iterate
  f0 = yield(x0)
  f1 = yield(x1) 
  for k in 1..iter_max do    
    h = -f1/((f1-f0)/(x1-x0))
    break if h.abs < tol # interrompo ciclo se passo 
                         # piu piccolo della tolleranza
    x << x.last+h # x = x + h
    x0 = x1
    x1 = x.last
    f0 = f1
    f1 = yield(x1)
  end
  return x
end

fun = SqrtFun.new 2

#x = newton( 2, 1e-10, 10 ){ |x| [fun.f(x),fun.df(x)] }
x = newton( 2, 1e-10, 10 ){ |x| [x*x-3,2*x] }

puts "x = #{x}"
err_asymptotic( x, Math::sqrt(3.0))

x = secanti( 2, 3, 1e-10, 10 ){ |x| x*x-3 }

puts "x = #{x}"
err_asymptotic( x, Math::sqrt(3.0))


