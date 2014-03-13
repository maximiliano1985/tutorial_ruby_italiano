#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: e.2_cambio_base.rb
#
#  Autori:
#     Enrico Bertolazzi and Carlos Maximiliano Giorgio Bort
#     Dipartimento di Ingeneria Industriale
#     Università di Trento
#
#  Sito web:
#     http://www.ing.unitn.it/~bertolaz/
#
#  Contatti:
#     enrico.bertolazzi@unitn.it
#     cm.giorgiobort@unitn.it
#
#  Copyright (c) 2014 Università di Trento. Tutti i diritti riservati.
#     
#-------------------------------------------------------------------------


# 101110 -> 46
# 100001 -> 33
# 111100 -> 33
# 1010000000 -> 640


## VERSIONE SEMPLICE
def bin2int(bin)
  sbin = bin.to_s
  
  int = 0
  n = sbin.length-1
  for i in 0 .. n
    exp = n-i
    bit = sbin[i].to_i
    p bit
    int = int + bit*2**exp
  end
  
  return int
end
x = bin2int 101110
puts "bin2int 101110 -> #{x}"


## VERSIONE COMPATTA
def bin2int_c(bin)
  sbin = bin.to_s
  int = 0
  n = sbin.length-1
  sbin.chars.each_with_index{ |bit, i| int += bit.to_i*2**(n-i) }
  return int
end
x_c = bin2int_c 101110
puts "bin2int_c 101110 -> #{x_c}"




# Cambio base. Posso usare le stringhe per i cambi base, e.g. in binario o esadecimale.
# NOTE: riferimento a http://www.asciitable.com per le conversioni
x = 10
x_binario = x.to_s(2)
puts "x = #{x} in binario è #{ x_binario }"
x_esadecimale = x.to_s(16)
puts "x = #{x} in esadecimale è 0x#{ x_esadecimale }"
# per tornare indietro posso usare il metodo .hex
x_decimale = x_esadecimale.hex
puts "torno indietro, x_esadecimale #{x_esadecimale} in decimale è #{x_decimale} "
puts ""




# In alternativa posso usare il metodo UNPACK, che mi da più opzioni ma devo stare attento!
# NOTE: riferimento a http://www.ruby-doc.org/core-2.1.0/String.html#method-i-unpack per la funzione unpack
num = 7
num_bin = num.to_s 2
puts "#{num} in binario è #{num_bin}"
num_unpack = num.to_s.unpack("B*")
puts "#{num} convertito con unpack in binario è #{num_unpack}"
# NOTA CHE HO DUE RISULTATI DIVERSI, QUESTO è PERCHè UNPACK TRATTA NUM COME SE FOSSE UN CARATTERE ASCII E NON UN NUMERO DECIMALE! INFATTI MI RESTUISCE "00110011" CHE CORRISPONDE ALLA RAPPRESENTAZIONE BINARIA DI 51. VERIFICO:
num_8bit = num.to_s.unpack("U*")
puts "#{num} convertito con unpack in carattere a 8 bit è #{num_8bit}"
puts "num_unpack = #{num_unpack} e #{num_8bit} in binario vale #{num_8bit[0].to_s(2)}"

# MORALE: USO UNPACK SOLO PER CONVERTIRE CARATERE ASCII IN ESADECIMALE O BINARIO


