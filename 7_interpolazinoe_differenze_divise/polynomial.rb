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


# Classe polinomio
class Polynomial
  attr_reader :dd
  attr_reader :x
  attr_reader :coeffs
  attr_reader :omega
  
  #
  # inizializza il polinomio al polinomio vuoto
  #
  def initialize( cf = [] )
    @dd     = [] # differenze finite
    @x      = [] # ascisse di interpolazione
    @omega  = [] # coefficienti polinomio omega della interpolazione di Newton
    @coeffs = cf # coefficienti polinomio interpolante o polinomio passato
  end

  #
  #  aggiunge un punto di interpolazione al polinomio
  #
  def add(x,y)
    update_dd(x,y)
    update_omega(x)
    update_coeffs()
  end
  
  #
  # somma di due polinomi
  #
  def +(other)
    # calcolo ordine polinomio in uscita
    a = self.coeffs.dup # per non modificare i @coeff di self
    b = other.coeffs
    n = [ a.size, b.size ].max
    while a.size < n do a << 0 end
    while b.size < n do b << 0 end
    for i in 0...n do a[i] += b[i] end # meglio un collect per risparmare il dup
    return Polynomial.new a
  end
  
  #
  # converte il polinomio in una stringa "human readable"
  #
  def to_s
    tmp = ""
    @coeffs.each_with_index do |c,idx|
      if idx == 0 then
        tmp += c.to_s
      elsif idx == 1 then
        tmp += " + " + c.to_s + " * x"
      else
        tmp += " + " + c.to_s + " * x^" + idx.to_s
      end
    end
    tmp = "0" if tmp.empty?
    return tmp
  end

private  

  #
  # date le differenze divise dd[] che contiene
  # f[x0], f[x0,x1], ...., f[x0,x1,...,xn]
  # aggiunge in coda la differenza divisa f[x0,x1,...,xn,x[n+1]]
  #
  def update_dd(x,y)
    n = @dd.size
    if n == 0 then
      @dd << y
    else
      d = y
      for k in 0...n do # fino a n-1
        d = (@dd[k]-d)/(@x[k]-x)
      end
      @dd << d # d contiene f[x0,x1,...,x[n+1]]
    end
  end
  #
  # dato omega[n](x) costruisco 
  # omega[n+1](x) = omega[n](x)*(x-x[n])
  # dove x[n] = @lastx
  def update_omega(x)
    n = @omega.size
    if n == 0 then
      @omega << 1
    else
      # moltiplico @omega * (x-@x[n]) = @omega * x - @x[n] * @omega
      @omega.insert(0,0) ;
      for k in 0...n do
        @omega[k] = @omega[k] - @omega[k+1]*@x[-1]
      end
    end
    @x << x
  end
  #
  # aggiunge al polinomio 
  # p(x) = f[x0]+f[x1]*(x-x0)+ .... +f[x0,x1,...,xn]*omega[n](x)
  # il polinomio
  # f[x0,x1,...,xn,x[n+1]]*omega[n+1](x)
  # p(x) interpola anche l'ultimo punto inserito
  def update_coeffs()
    n = @coeffs.size
    @coeffs << 0 ;
    for k in 0..n do
      @coeffs[k] += @omega[k] * @dd[-1]
    end
  end
end

if __FILE__ == $0
  poly = Polynomial.new
  puts "poly = "+poly.to_s
  poly.add(1,5)
  puts "poly = "+poly.to_s
  poly.add(2,15)
  puts "poly = "+poly.to_s
  poly.add(3,31)
  puts "poly = "+poly.to_s
  poly1 = Polynomial.new [1,2,3]
  
  poly2 = poly+poly1
  puts "poly = "+poly.to_s
  puts "poly1 = "+poly1.to_s
  puts "poly+poly1 = "+poly2.to_s
  
end