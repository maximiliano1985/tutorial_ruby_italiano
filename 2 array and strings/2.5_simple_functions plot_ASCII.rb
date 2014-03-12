COLONNE_PLOT = 100
RIGHE_PLOT   = 20
DIGITS       = 2
SYMBOL       = "*"

def plot_matrix(mat)
  str = ""
  mat.each do |riga|
    str += riga.join + "\n"
  end
  puts str
end

def plot_points(x_ary, y_ary)
  x_lim = [x_ary.min, x_ary.max]
  y_lim = [y_ary.min, y_ary.max]
  
  # INIZIALIZZA IL GRAFICO
  plot = []
  (RIGHE_PLOT+1).times{ plot << [" "]*COLONNE_PLOT }
  
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
  
  plot_matrix plot
end



if __FILE__ == $0
  function = lambda do |x|
  	x**2+x+1
  end
  
  # Genera i dati
  res = 10**(-DIGITS).to_f
  x_pts = (-2 .. 2).step( res ).to_a
  y_pts = []
  x_pts.each{|x| y_pts << function.call(x) }
  
  plot_points x_pts, y_pts
  
end