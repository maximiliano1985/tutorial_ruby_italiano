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

ESN = {'uno'=>1, 'due'=>2, 'tre'=>3, 'quattro'=>4, 'cinque'=>5}

# only for older versions of ruby it is necessary to implement the round method
if RUBY_VERSION <= "1.8"
  class Float
    def round(n)
      return ("%.#{n}f" % self).to_f
    end    
  end
end

class Array
  def downcase
    self.collect do |el|
      el.downcase if el.is_a? String or el.is_a? Symbol
    end
  end
  
  def upcase
    self.collect do |el|
      el.upcase if el.is_a? String or el.is_a? Symbol
    end
  end
end

class String
  def color(col); return "\e[#{col}m" << self << "\e[0m";end
end
def puts_color(col)
  return "\e[#{col}m"
end

class Checker
  
  def initialize(filename)
    @n = filename.split("_").first.to_i
    @n_es = 0
    check_es
  end  
  
  def code_efficiency
    IO.foreach($0).count{|line| !(line.chomp.empty? || line =~ /^\s*#/) }
  end
  
  def cinque
    begin
      raise RuntimeError, "Non e' stata definita nessuna funzione con il nome --eulero_avanti--".color(RED) if defined?(eulero_avanti).nil?
      
      dati = eulero_avanti(x0=0, x1=2, y0=1, 10){|x,y| -y-3*x}
      res1 = {
        :x=>[0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2],
        :y=>[1, 0.8, 0.52, 0.176, -0.219, -0.655, -1.124, -1.619, -2.136, -2.668, -3.215]
      }
      raise RuntimeError, "La funzione 'eulero_avanti' deve restituire una hash".color(RED) unless dati.is_a? Hash
      [:x, :y].each do |k|
        raise RuntimeError, "La hash restituita da 'eulero_avanti' non contiene una chiave #{k}".color(RED) unless dati.keys.downcase.include? k
        raise RuntimeError, "La chiave #{k} della hash restituita da 'eulero_avanti' non punta ad un Array, ma a un #{res1[k].class}".color(RED) unless dati[k].is_a? Array
        dati[k].each do |n|
          raise RuntimeError, "La chiave #{k} della hash restituita da 'eulero_avanti' non contiene numeri Float ma #{n.class}".color(RED) unless n.is_a? Numeric
        end
      end
      raise RuntimeError, "Le chiavi :x e :y della hash restituita da 'eulero_avanti' contengono un numero diverso di dati".color(RED) unless dati[:x].size == dati[:y].size
      
      dati[:x].size.times do |i|
        raise RuntimeError, "1 check: errore nell'intervallo di integrazione".color(RED) unless dati[:x][i].round(3) == res1[:x][i]
        raise RuntimeError, "1 check: errore nella integrazione".color(RED) unless dati[:y][i].round(3) == res1[:y][i]
      end
      
      dati = eulero_avanti(x0=1, x1=20, y0=20, 20){|x,y| -y*2-1/x}
      res2 = {
        :x=>[1, 1.95, 2.9, 3.8499999999999996, 4.8, 5.75, 6.7, 7.65, 8.6, 9.549999999999999,
            10.499999999999998, 11.449999999999998, 12.399999999999997, 13.349999999999996,
            14.299999999999995, 15.249999999999995, 16.199999999999996, 17.149999999999995, 
            18.099999999999994, 19.049999999999994, 19.999999999999993],
        :y=>[20, -18.949999999999996, 16.56782051282051, -15.238624668435008, 13.468008954838261,
            -12.319124726021098, 10.921994862114637, -9.97158642067929, 8.850244772075413,
            -8.075685411146939, 7.168640430241668, -6.5422525776936915, 5.805057887609912,
            -5.301165002074727, 4.699887453178116, -4.296332274293871, 3.8044039648972703,
            -3.4826055437161854, 3.0789514033387357, -2.823542450850165, 2.4913194393609492]
      }
      dati[:x].size.times do |i|
        raise RuntimeError, "1 check: errore nell'intervallo di integrazione".color(RED) unless dati[:x][i].round(3) == res2[:x][i].round(3)
        raise RuntimeError, "1 check: errore nella integrazione".color(RED) unless dati[:y][i].round(6) == res2[:y][i].round(6)
      end   
    rescue => e
      puts e
      return false
    end    
    return true
  end
  
  def quattro
    begin
      raise RuntimeError, "Non e' stata definita nessuna funzione con il nome --hanoi--".color(RED) if defined?(hanoi).nil?
      
      ref = {
        2=>[[0, 1], [0, 2], [1, 2]],
        5=>[[0, 2], [0, 1], [2, 1], [0, 2], [1, 0], [1, 2], [0, 2], [0, 1], [2, 1],
            [2, 0], [1, 0], [2, 1], [0, 2], [0, 1], [2, 1], [0, 2], [1, 0], [1, 2],
            [0, 2], [1, 0], [2, 1], [2, 0], [1, 0], [1, 2], [0, 2], [0, 1], [2, 1],
            [0, 2], [1, 0], [1, 2], [0, 2]],
        3=>[[0, 2], [0, 1], [2, 1], [0, 2], [1, 0], [1, 2], [0, 2]]
      }
      ref.each do |k,v|
        puts "Testando la torre di Hanoi con #{k} dischi..."
        $torri = [[*1..k].reverse, [], []]
        res = hanoi(k)
        
        raise RuntimeError, "La funzione 'solve_hanoi_tower' deve restituire un Array di movimenti".color(RED) unless res.class == Array
        res.each_with_index do |mov, indx|
          raise RuntimeError, "Il movimento #{indx} della lista di movimenti deve essere un Array di due numeri".color(RED) unless mov.class == Array && mov.size == 2
          raise RuntimeError, "Errore nel calcolo del movimento numero #{indx}, quando il gioco ha #{k} dischi".color(RED) unless mov == v[indx]
        end
      end
    rescue => e
      puts e
    end
  end
  
  def tre
    begin
      raise RuntimeError, "Non e' stata definita nessuna classe con il nome --Machine--".color(RED) if defined?(Machine).nil?
      raise RuntimeError, "--Machine-- deve essere una classe".color(RED) unless Machine.class == Class
    
      mach = Machine.new
      # Inserisco la moneta
      input = 'm'
      puts "> Input: moneta #{input}"
      res = mach.leggi_input(input)
      raise RuntimeError, "Il metodo 'leggi_input' deve restituire un array con la lista degli stati attraversati".color(RED) unless res.class == Array
      raise RuntimeError, "La macchina non ha attraversato nessuno stato".color(RED) if res.size == 0
      res.each do |st|
        raise RuntimeError, "Lo stato #{st} deve essere rappresentato da un simbolo".color(RED) unless st.class == Symbol
      end
      puts "stati attraversati: #{res}"
      # Seleziono bevanda 's'
      input = 's'
      puts "> Input: selezione #{input}"
      res = mach.leggi_input(input)
      puts "stati attraversati : #{res}"

      check1 = [:idle, :selezione, :prepara, :idle]
      res.each do |st|
        raise RuntimeError, "Lo stato #{st} non e' tra quelli noti".color(RED) unless [:idle,:selezione,:informa,:prepara,:reset].include? st
      end
      raise RuntimeError, "Errore nella prima verifica: gli stati attesi sono #{check1}, ma la macchina ha transitato attraverso #{res}".color(RED) unless res == check1
    
      # Inserisco la moneta
      input = 'm'
      puts "> Input: moneta #{input}"
      puts "stati attraversati : #{mach.leggi_input(input)}"
      # Annullo la selezione
      input = 'a'
      puts "> Input: annulla #{input}"
      res = mach.leggi_input(input)
      puts "stati attraversati : #{res}"
      check2 = [:idle, :selezione, :prepara, :idle, :selezione, :reset, :idle]
      raise RuntimeError, "Errore nella seconda verifica: gli stati attesi sono #{check2}, ma la macchina ha transitato attraverso #{res}".color(RED) unless res == check2
      return true
    rescue => e
      puts e
      puts e.backtrace
      return false
    end
  end
  
  def due
    begin
      raise RuntimeError, "Non e' stata definita nessuna funzione con il nome --from10to3--".color(RED) if defined?(from10to3).nil?
      raise RuntimeError, "from10to3 deve essere definita come una funzione".color(RED) unless defined?(from10to3) == 'method'
      test_n = [10,23,432,718]
      res_b3 = [101, 212, 121000, 222121]
      test_n.each_with_index do |n, indx|
        res = from10to3(n)
        raise RuntimeError, "La funzione from10to3 deve restituire una stringa".color(RED) unless res.class == String
        raise RuntimeError, "La funzione from10to3 non calcola correttamente la conversione in base 3".color(RED) unless res == res_b3[indx].to_s
      end
      return true
    rescue => e
      puts e
      return false
    end
  end
  
  def uno
    begin
      raise RuntimeError, "La matrice --$chess_matrix-- non e' stata definita".color(RED) unless defined? $chess_matrix
      raise RuntimeError, "La matrice $chess_matrix deve essere un Array, non un #{$chess_matrix.class}".color(RED) unless $chess_matrix.class == Array
      raise RuntimeError, "La matrice $chess_matrix non e' stata riempita".color(RED) if $chess_matrix.empty?
      raise RuntimeError, "La matrice $chess_matrix deve avere N = #{N} righe".color(RED) unless $chess_matrix.size == N

      $chess_matrix.each_with_index do |row, indx|
        raise RuntimeError, "La riga #{indx} e' nil".color(RED) if row.nil?
        raise RuntimeError, "La riga #{indx} deve essere un Array di Array, non un Array di #{$chess_matrix.first.class}".color(RED) unless row.class == Array
        raise RuntimeError, "La riga #{indx} non e' stata riempita".color(RED) if row.empty?
        raise RuntimeError, "La riga #{indx} ha un numero di elementi diverso da M = #{M}".color(RED) unless row.size == M
      
        row.each_with_index do |ch, jndx|
          raise RuntimeError, "L'elemento $chess_matrix[#{indx}][#{jndx}] e' nil".color(RED) if $chess_matrix[indx][jndx].nil?
          raise RuntimeError, "L'elemento $chess_matrix[#{indx}][#{jndx}] deve essere una stringa".color(RED) unless $chess_matrix[indx][jndx].class == String
          raise RuntimeError, "L'elemento $chess_matrix[#{indx}][#{jndx}] deve contenere un solo carattere".color(RED) unless $chess_matrix[indx][jndx].size == 1
          if (indx+jndx).even?
            raise RuntimeError, "L'elemento $chess_matrix[#{indx}][#{jndx}] deve essere un asterisco '*'".color(RED) unless $chess_matrix[indx][jndx] == '*'
          else
            raise RuntimeError, "L'elemento $chess_matrix[#{indx}][#{jndx}] deve essere uno spazio bianco ' '".color(RED) unless $chess_matrix[indx][jndx] == ' '
          end
        end
      end
      return true
    rescue => e
      puts e
      return false
    end
  end
  
  def test
    return true if @n_es>=3
  end
  
  private
  
  def check_es
    raise ArgumentError, "Impossibile correggere l'esercizio #{@n}, verificare il nome del file da correggere".color(RED) unless ESN.values.include? @n    
    enc.each do |es|
      n = ESN[es]
      puts "Valutazione esercizio numero #{n}".color(BROWN)
      if self.send(es)
        puts "Esercizio numero #{n} corretto!".color(GREEN)
        @n_es += 1
      else
        exit
      end
    end
  end
    
  def enc
    x = @n.to_i
    
    es_names = [
      '1_chess_matrix.rb',
      '2_base_conversion.rb', 
      '3_macchina_a_stati.rb', 
      '4_torre_hanoi.rb',
      '5_metodo_eulero_avanti.rb'
    ]
    
    if x > 1
      (x-1).times do |i|
        raise RuntimeError, "Manca file #{es_names[i]}".color(RED) unless File.exist?(es_names[i])
        load(es_names[i])
      end
    elsif x > es_names.size
      raise ArgumentError, "Numero di esercizio #{x} non valido".color(RED)
    end
    
    raise RuntimeError , "Non esiste una variabile globale - Nome -, si prega di definirla".color(RED)      unless defined? Nome
    raise RuntimeError , "Non esiste una variabile globale - Cognome -, si prega di definirla".color(RED)   unless defined? Cognome
    raise RuntimeError , "Non esiste una variabile globale - Matricola -, si prega di definirla".color(RED) unless defined? Matricola
    raise ArgumentError, "Specificare nome dello studente".color(RED)      if Nome.empty?
    raise ArgumentError, "Specificare cognome dello studente".color(RED)   if Cognome.empty?
    raise ArgumentError, "Specificare matricola dello studente".color(RED) if Matricola.to_i == 0
    
    return ESN.keys[0..x-1]
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


c = Checker.new $0
if c.test
  puts "Raggiunti i requisiti minimi necessari per caricare il proprio compito"
  puts "Password: #{crc16("#{Cognome}.#{Nome}")}"
else
  puts "Per poter caricare il proprio compito e' necessario aver svolto correttamente i primi tre esercizi"
end