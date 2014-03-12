puts 'INIZIALIZZAZIONE'

# array vuoto
ary  = []
ary1 = Array.new

# visualizza tutti i metodi nativi degli array
puts ary.methods.sort
puts "\n"

# controlla cos'è ary
puts "la variabile ary è un #{ary.class}\n"

# controlla se l'array è vuoto
puts "l'array ary è vuoto? #{ary.empty?}\n"






ary2 = Array.new(20)
puts "ary2 è un array di 20 elementi, tutti nulli:\n#{ary2}\n\n"

# size / length (they are the same!)
puts 'Posso controllare la dimensione di ary2 con:'
puts "ary2.size ---> #{ary2.size}"
puts "ary2.length ---> #{ary2.length}"
puts ""




ary3 = Array.new(6, 4)
puts "ary3 è un array di 6 elementi, tutti uguali a 4:\n#{ary3}"
puts ""

ary4 = Array.new(3, 'hello')
puts "ary4 è un array di 3 elementi, tutti uguali a 'hello':\n#{ary4}"
puts ""


puts "In alternativa, posso generare un array di 'n' elementi tutti uguali a X, con il comando: [X]*n
se n=6 e X=2 scriverò [2]*6:
#{[2]*6}"
puts ""

ary5 = Array(0..6)
puts "ary5 è un array di una sequenza di numeri crescenti:\n#{ary5}"
puts ""



puts "_"*30
puts "CICLI NEGLI ELEMENTI DELL'ARRAY"

puts "a) ciclo 'for'"
for i in 0 .. ary5.length-1
  puts ary5[i]
end

puts "b) ciclo 'each'"
ary5.each do |e|
  puts e
end
puts "c) ciclo 'each' versione compatta"
ary5.each{ |e| puts e }



puts "_"*30
puts 'COPIARE ARRAY'
puts '>>> modo sbagliato:'
puts "ary5 vale #{ary5}"

copy_ary5 = ary5
puts "copy_ary5 vale #{copy_ary5}"
puts ''
puts "Cambio il 4° elemento in copy_ary5 a 999"
copy_ary5[4] = 999
puts "copy_ary5 vale #{copy_ary5}"
puts "ma ora ary5 vale #{ary5}"
puts ''


puts '>>> modo corretto:'
ary5 = Array(0..6)
puts "ary5 vale #{ary5}"

copy_ary5 = ary5.dup
puts "copy_ary5 vale #{copy_ary5}"
puts ''
puts "Cambio il 4° elemento in copy_ary5 a 999"
copy_ary5[4] = 999
puts "copy_ary5 vale #{copy_ary5}"
puts "ora ary5 vale #{ary5}"
