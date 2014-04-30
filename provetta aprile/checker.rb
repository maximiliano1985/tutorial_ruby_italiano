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

#require File.expand_path("provetta_aprile.rb")
RED   = 101
GREEN = 102
BROWN = 7

raise RuntimeError , "Non esiste una variabile globale - Nome -, si prega di definirla".color(RED)      unless defined? Nome
raise RuntimeError , "Non esiste una variabile globale - Cognome -, si prega di definirla".color(RED)   unless defined? Cognome
raise RuntimeError , "Non esiste una variabile globale - Matricola -, si prega di definirla".color(RED) unless defined? Matricola
raise ArgumentError, "Specificare nome dello studente".color(RED)      if Nome.empty?
raise ArgumentError, "Specificare cognome dello studente".color(RED)   if Cognome.empty?
raise ArgumentError, "Specificare matricola dello studente".color(RED) if Matricola.to_i == 0

class String
  def color(col); return "\e[#{col}m" << self << "\e[0m";end
end
def puts_color(col)
  return "\e[#{col}m"
end

class Checker
  attr_reader :test
  
  def initialize(h)
    @r_h  = h
    @test = false
  end
  
  def check_es(n)
    raise ArgumentError, "Specificare il numero dell'esercizio da correggere".color(RED) if n.nil?
    puts "Valutazione esercizio numero #{n}".color(BROWN)
    enc(n)
    puts "Esercizio numero #{n} corretto!".color(GREEN)
  end
  
  
  def code_efficiency
    IO.foreach($0).count{|line| !(line.chomp.empty? || line =~ /^\s*#/) }
  end
  
  
  def quattro
    raise RuntimeError, 'La hash $provetta - non ha una chiave :dizionario'.color(RED) unless @r_h.has_key? :dizionario
    self.due
    raise RuntimeError, "Il dizionario contiene parole che si ripetono".color(RED) if self.tre(@r_h[:dizionario]).index{ |a| a.last != 1 }
    a = self.tre(@parole.uniq)
    if @r_h[:dizionario].size < a.size
      raise RuntimeError, "Al dizionario mancano #{a.size - @r_h[:dizionario].size} parole".color(RED)
    elsif @r_h[:dizionario].size > a.size
      raise RuntimeError, "Al dizionario ha #{@r_h[:dizionario].size - a.size} parole in più".color(RED)
    end
  end
  
  
  def due
    self.uno
    raise RuntimeError, 'La hash $provetta - non ha una chiave :n_parole'.color(RED) unless @r_h.has_key? :n_parole
    raise RuntimeError, 'La hash $provetta - non ha una chiave :parole'.color(RED) unless @r_h.has_key? :parole
    
    @parole = @r_h[:testo].collect{ |paragr| (paragr.downcase!||paragr).split(" ") }
    @parole.flatten!
    n_parole = @parole.size
    
    raise RuntimeError, "2.a) Il testo ha #{n_parole}, ma ne sono state individuate #{@r_h[:n_parole]}".color(RED) unless n_parole == @r_h[:n_parole]
    raise RuntimeError, '2.b) Le parole estratte dal testo non sono corrette'.color(RED) unless @parole.sort == @r_h[:parole].sort
    
    @test = true
  end
  
  def uno
    #puts @r_h
    raise RuntimeError, 'La hash $provetta non è stata definita'.color(RED) unless defined? @r_h
    raise RuntimeError, 'La hash $provetta non ha una chiave :testo'.color(RED) unless @r_h.has_key? :testo
    raise RuntimeError, "Non è stato inserito alcuna stringa nell'array puntato dalla chiave :testo".color(RED) if @r_h[:testo].empty?
  end
  
  def tre(a_i=nil)
    raise RuntimeError, 'La hash $provetta - non ha una chiave :parola_frequente'.color(RED) unless @r_h.has_key? :parola_frequente
    raise RuntimeError, 'La hash $provetta - non ha una chiave :n_parola_frequente'.color(RED) unless @r_h.has_key? :n_parola_frequente
    cl = @r_h[:parola_frequente].class
    raise RuntimeError, "La parola più frequente deve essere una String, non una #{cl}".color(RED) unless cl == String
    self.due
    
    a_h = a_i || @r_h[:parole]
    h = {}
    a_h.each{ |par| h[par] = h.has_key?(par) ? (h[par] + 1) : 1 }
    v = h.sort{|x, y| y.last <=> x.last}
    unless a_i
      raise RuntimeError, "La parola più frequente individuata -#{@r_h[:parola_frequente]}- non è corretta".color(RED) unless v.first.first  == @r_h[:parola_frequente]
      raise RuntimeError, "Il numero di volte per cui la parola #{@r_h[:parola_frequente]} si ripete non è corretto".color(RED) unless v.first.last == @r_h[:n_parola_frequente]
    end
    return v
  end
  
  private
  def enc(xx)
    x = xx.to_i
    if x == 1
      return 'uno'
    elsif x == 2
      return 'due'
    elsif x == 3
      return 'tre'
    elsif x == 4
      return 'quattro'
    else
      raise ArgumentError, 'Numero di esercizio non valido'.colo(RED)
  end
end



def crc16(string)
  crc = 0xFFFF
  string.downcase.each_char do |c|
    crc =  crc ^ c.unpack('c').first
    8.times{ |y| crc = (crc & 0x0001) == 0x0001 ? ((crc >> 1) ^ 0xA001) : crc >> 1}
  end # string.each_char
  return crc.to_s(16)
end # def crc16


#if __FILE__ == $0
  c = Checker.new $provetta
  c.check_es ARGV[0]
  if c.test
    puts "Raggiunti i requisiti minimi necessari per caricare il proprio compito"
    puts "Password: #{crc16("#{Cognome}.#{Nome}")}"
  else
    puts "Per poter caricare il proprio compito è necessario aver svolto correttamente i primi due esercizi"
  end
  #puts c.code_efficiency
#end