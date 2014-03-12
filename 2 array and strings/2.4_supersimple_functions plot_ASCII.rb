COLONNE_PLOT = 100
RIGHE_PLOT   = 20
DIGITS       = 2
SYMBOL       = "*"


def function(x)
  y = x**2+x+1
  return y
end

def plot_matrix(mat)
  str = ""
  mat.each do |riga|
    str += riga.join + "\n"
  end
  puts str
end



# Genera i dati
res = 10**(-DIGITS).to_f
x_pts = (-10 .. 10).step( res ).to_a
y_pts = []
x_pts.each{|x| y_pts << function(x) }

# cerco i valori minimo e massimo dei due array
x_lim = [x_pts.min, x_pts.max]
y_lim = [y_pts.min, y_pts.max]


# SCALATURA E TRASLAZIONE DELLE COORDINATE DEL PUNTO AFFINCHE' IL GRAFICO 
# RIENTRI NELLA CORNICE PRESTABILITA
# calcolo i fattori di scala
x_scala = COLONNE_PLOT.to_f/(x_lim.last - x_lim.first)
y_scala = RIGHE_PLOT.to_f/(y_lim.last - y_lim.first)
# scalo ogni valore
x_pts.collect! do |x|
  (x - x_lim.first)*x_scala
end
# per y faccio la stessa cosa ma con una notazione più compatta
y_pts.collect!{ |y| (y - y_lim.first)*y_scala }



# INIZIALIZZA IL GRAFICO con degli spazi bianchi
plot = []
(RIGHE_PLOT+1).times do
  plot << [" "]*COLONNE_PLOT
end


# AGGIUNTA DEI PUNTI AL GRAFICO
x_pts.each_with_index do |x, i|
  y = y_pts[i]
  
  x_indx = x.to_i # indice delle colonne
  y_indx = y.to_i # indice delle righe
  
  plot[y_indx][x_indx] = SYMBOL
end



#plot_matrix plot

# specchio il grafico rispetto all'asse x in modo da averlo orientato correttaimente
plot.reverse!

plot_matrix plot