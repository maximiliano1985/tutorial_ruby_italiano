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

require 'pry'



#__________________________________________________________________________
# 1. Leggere il file 'log.txt', e salvare ogni colonna in una hash dove la corrispondente chiave è ottenuta dall'intestazione del file. Farsi restiuire le chiavi della hash 'dati' e la dimensione della colonna con i dati sul tempo
#__________________________________________________________________________
file = 'log.txt'

puts "Caricamento dei dati in #{file}"

# verifico se il file esiste
esiste = File.exists? file
raise ArgumentError, "Il file #{file} non esiste" unless esiste

str_frmt = " %.2f |"*9
str_frmt.chop! 
str_frmt += "\n"

dati = {}
File.open(file, 'r') do |file|
  
  intestazione = file.gets.split " "
  intestazione.each_with_index do |s, i|
    dati[s.to_sym] = []
    dati[i] = dati[s.to_sym] # così ho due modi per accedere allo stesso array: con una chiave o con un indice!
  end # intestazione.each

  file.each_line do |line|
    parole = line.split " "
    
    # stampo a video la stringa letta
    print str_frmt % ary
    
    # converto ogni parola nella linea in un Float (numero con la virgola)
    parole.each_with_index{|s, i| dati[i] << s.to_f}
  end # file.each...
end # File.open...

# Siccome non accederò più a 'dati' mediante numeri ma soltanto con i simboli, cancello tutte le coppie chiave-valore le cui chiavi siano interi
dati.each_key{|k| dati.delete k if k.is_a? Integer}


#__________________________________________________________________________
# 2. Calcolare il valore medio e la deviazione standard di ogni colonna nella hash 'dati'. Trascurare le chiavi della hash 'dati' che sono numeri interi. Per una migliore rappresentazione arrotondare i numeri alla terza cifra significativa
#__________________________________________________________________________
puts "Calcolo media e varianza dei dati"

def mean(ary)
  is_array  = ary.is_a? Array
  is_number = ary.first.is_a? Numeric
  raise ArgumentError, "Posso calcolare la media solo di un array di numeri" unless is_array && is_number
  
  s = ary.inject(0){|sum, x| sum+x}
  l = ary.size
  return s/l
end

def std(ary)
  #array?  = ary.is_a? Array
  #numero? = ary.first.is_a? Numeric
  #raise ArgumentError, "Posso calcolare la deviazione standard solo di un array di numeri" unless array && numero?
  
  m = mean(ary)
  l = ary.size
  sq = ary.inject(0){|sum, x| sum + (x-m)**2}
  return Math::sqrt(sq/l)
end

puts "="*40
dati.each{|k,v| puts "#{k}\t: media #{mean(v).round(3)}, std #{std(v).round(3)}" unless k.is_a? Integer}
puts "="*40




#__________________________________________________________________________
# 3. Trasporre la matrice salvata in 'log.txt', salvandola in un file chiamato 'log.trasp.txt'
#__________________________________________________________________________
puts "Trasposizione dei dati"

tr_file = File.new('log.trasp.txt', 'w')

dati.each do |k, v|
  str = k.to_s << " "
  str << v.inject(){|sum, x| sum.to_s+" "+x.to_s}
  tr_file.puts str
end

tr_file.close


