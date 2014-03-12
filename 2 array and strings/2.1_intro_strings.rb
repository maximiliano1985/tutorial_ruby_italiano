str = "Ciao mondo!"
puts str

# stringhe interpolate e non
str_ni = 'questa è \n una stringa \t non interpolata'
puts str_ni
p str_ni # una stampa più completa
# p str_ni equivale a puts str_ni.inspect
puts str_ni.inspect
puts ""
str_i = "questa è \n una stringa \t interpolata"
puts str_i


# interpolare variabili nelle stringhe
eta  = 5
nome = 'rex'
str_ni = 'il mio cane #{nome} ha #{eta} anni (non interpolata)'
str_ni = "il mio cane #{nome} ha #{eta} anni (sì interpolata)"
puts ""

# concatenare stringhe
str = 'ora'
puts str
str += ' concateniamo' # equivale a str = str + ' sono'
puts str
str << " le"
puts str
str.concat " stringhe"
puts str
puts ""

# il punto esclamativo: alcune funzioni sono disponibili ANCHE nella forma con il punto esclamativo finale. In tal caso, le operazioni effettuate sulla variabile sono applicate direttamente su essa.
# convertiamo una stringa da minuscolo a maiuscolo
str = "convertimi a maiuscolo"
puts "str.upcase #{str.upcase}" 
puts "str #{str}" # str è minuscola

puts "str.upcase! #{str.upcase!}" 
puts "str #{str}" # str è maiuscola
puts ""
# NOTA: per vedere le funzioni di default che è possibile usare con le stringhe è possibile digitare nell'irb: puts String.methods.sort


# ripetere una stringa
str = "ciao "*5
puts str
puts "\n"*2