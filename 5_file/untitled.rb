file  = 'log.txt'
puts "Caricamento dei dati in #{file}"

esiste = File.exists? file
raise ArgumentError, "Ocio che il file #{file} non esiste" unless esiste == true #if esiste == false

dati = {}

File.open(file, 'r') do |file|
  intestazione = file.gets.split " "
  intestazione.each_with_index do |s, i|
    dati[s.to_sym] = []
    dati[i] = dati[s.to_sym]
  end
  
  
  file.each do |line|
    numeri = line.split " "
    
    numeri.each_with_index{ |num, i| dati[i] << num.to_f  }
  end
end

dati.each_key{|k| dati.delete(k) if k.is_a? Integer}


def mean(ary = [])
  is_array = ary.is_a? Array
  is_number = ary.first.is_a? Numeric
  raise ArgumentError, "Posso calcolare la media solo di un array di numeri" unless is_array && is_number
  
  s = ary.inject(0){|sum, x| sum+x}
  l = ary.size
  return s/l
end


def std(ary)
  is_array = ary.is_a? Array
  is_number = ary.first.is_a? Numeric
  raise ArgumentError, "Posso calcolare la media solo di un array di numeri" unless is_array && is_number
  
  m = mean(ary)
  l = ary.size
  
  sq = ary.inject(0){ |sum, x| sum + (x-m)**2 }
  return Math::sqrt(sq/l)
end

puts "="*40
dati.each do |k, v|
  media = mean(v).round(3)
  dev_std = std(v).round(3)
  puts "#{k}\t: media #{media}, std #{dev_std}"
end
puts "="*40



tr_file = File.open('dati.trasposti.txt', 'w')


dati.each do |k, ary|
  str = k.to_s
  str << " "
  str << ary.inject(){|sum, x| sum.to_s + " " + x.to_s}
  tr_file.puts str
end

tr_file.close