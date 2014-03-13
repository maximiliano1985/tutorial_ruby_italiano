#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: e.5_plot_ASCII.rb
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

COLONNE_PLOT = 100
RIGHE_PLOT   = 30
DIGITS       = 2
SYMBOL       = "*"

def plot_matrix(mat)
  str = ""
  mat.each do |riga|
    str += riga.join + "\n"
  end
  puts str
end

def add_labels(mat, x_lim, y_lim)
  # AGGIUNTA DELLA SCALA (ESERCIZIO A CASA?)
  num_separazioni = 4
  delta_colonne = (x_lim.last-x_lim.first)/num_separazioni
  delta_righe   = (y_lim.last-y_lim.first)/num_separazioni
  x_label = (x_lim.first .. x_lim.last).step(delta_colonne).to_a#.reverse!
  y_label = (y_lim.first .. y_lim.last).step(delta_righe).to_a.reverse!
  x_label.collect!{|x| x.round(DIGITS).to_s}
  y_label.collect!{|y| y.round(DIGITS).to_s}
  # individua il numero più lungo
  x_l_num = 0 # lunghezza del numero più lungo nelle etichette di X
  y_l_num = 0
  x_label.each{|x| x_l_num = [x_l_num,x.size].max}
  y_label.each{|y| y_l_num = [y_l_num,y.size].max}
  
  # aggiusta le lunghezze delle etichette
  x_label.collect!{|x| x.rjust x_l_num}
  y_label.collect!{|y| y.rjust y_l_num}
  
  # aggiungo le etichette su Y
  delta = (RIGHE_PLOT)/num_separazioni
  mat.each_with_index do |riga, indx|
    str = indx % delta == 0 ? y_label.shift : " "*y_l_num
    riga.insert(0, str)
  end
  
  # aggiungo le etichette su X
  # lunghezza della riga meno la parte dovuta alle etichette in Y
  shift_a_dx = y_l_num
  l_riga  = mat.first.length - shift_a_dx
  # lunghezza totale delle etichette in X
  l_label = x_l_num * (x_label.size-1)
  # lunghezza degli spazi vuoti che posso usare per separare le etichette 
  delta_spazi = (l_riga - l_label)/(x_label.size-1)  
  # inserisco davanti al primo numero il pezzo di stringa 'vuota' per avere le 
  # etichette in X correttamente allineate con gli assi
  x_label.first.insert(0, " "*shift_a_dx )
  # inserisco gli spazi bianchi nell'array delle etichette.
  # Gli spazi bianchi vanno alternati ai numeri
  mat << x_label.flat_map{|e| [e," "*delta_spazi]}
  
  return mat
end


def plot_points(x_ary, y_ary)
  x_lim = [x_ary.min, x_ary.max]
  y_lim = [y_ary.min, y_ary.max]
  
  
  # INIZIALIZZA IL GRAFICO
  #plot = [[" "]*COLONNE_PLOT]*RIGHE_PLOT ### SBAGLIATO, CREA COPIE DI PUNTATORI AL PRIMO ARRAY
  plot = []
  RIGHE_PLOT.times{ plot << [" "]*COLONNE_PLOT }
  
  # aggiungi cornice
  plot.insert(0, ["_"]*COLONNE_PLOT) # superiore
  plot << ["_"]*COLONNE_PLOT         # inferiore
  plot.each_with_index do |riga, i|
    next if i == 0
    
    riga[0]  = "|"                   # sinistra
    riga[-1] = "|"                   # destra
  end
  
  
  # SCALATURA E TRASLAZIONE DELLE COORDINATE DEL PUNTO AFFINCHE' IL GRAFICO 
  # RIENTRI NELLA CORNICE PRESTABILITA
  x_scala = COLONNE_PLOT.to_f/(x_lim.last - x_lim.first)
  y_scala = RIGHE_PLOT.to_f/(y_lim.last - y_lim.first)
  x_ary.collect!{|x| (x - x_lim.first)*x_scala }
  y_ary.collect!{|y| (y - y_lim.first)*y_scala }
  
  # AGGIUNTA DEI PUNTI AL GRAFICO
  x_ary.each_with_index do |x, i|
    y = y_ary[i]
    
    x_indx = x.to_i # indice delle colonne
    y_indx = y.to_i # indice delle righe
    
    plot[y_indx][x_indx] = SYMBOL
  end
  
  # specchio il grafico rispetto all'asse x in modo da averlo orientato correttaimente
  plot.reverse!
  
  add_labels plot, x_lim, y_lim
  
  plot_matrix plot
  
end



# TODO: aggiungere il verso agli assi: '>' per X e '^' per Y
# TODO: aggiustare automaticamente il numero delle colonne e righe del grafico, in base al numero e lunghezza delle etichette sugli assi
# TODO: includere possibilità di cambio suddivisione degli assi

if __FILE__ == $0
  function = lambda do |x|
  	x #Math::sin x #x**2+x+1
  end
  
  # Genera i dati
  res = 10**(-DIGITS).to_f
  x_pts = (-10 .. 10).step( res ).to_a
  y_pts = []
  x_pts.each{|x| y_pts << function.call(x) }
  
  plot_points x_pts, y_pts
  
end