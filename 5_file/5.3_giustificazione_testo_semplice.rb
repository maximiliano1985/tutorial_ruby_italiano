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

#__________________________________________________________________________
# 1. Leggere il file 'testo.txt', salvare ogni paragrafo in una hash
#    e farsi stampare sul terminale ogni riga.
#    Durante questa operazione fare in modo di trascurare le righe
#    corrispondenti all'autore, data, e titolo del documento
#__________________________________________________________________________
file = 'testo.txt'

# verifico se il file esiste
esiste = File.exists? file
raise ArgumentError, "Il file #{file} non esiste" unless esiste

ht = {:testo => []}
n_linee_vuote = 0
IO.foreach(file) do |line|
  # stampo la linea
  puts line
  # pulisco la linea dai terminatori di stringa
  line.chomp!
  # salvo il testo in un array
  ht[:testo] << line if n_linee_vuote >= 2
  # conto il numero delle linee vuote
  n_linee_vuote += 1 if line.empty?
end




#__________________________________________________________________________
# 2. Contare e farsi stampare il numero di paragrafi, parole e di caratteri
#    (inclusi spazi bianchi) nel file.
#__________________________________________________________________________
ht[:n_paragrafi] = ht[:testo].size
ht[:n_parole]    = 0
ht[:n_caratteri] = 0
ht[:testo].each do |paragrafo|
  # numero di caratteri
  ht[:n_caratteri] += paragrafo.size
  ht[:n_parole]    += paragrafo.split(" ").size
end

puts "_"*40
puts "Il testo contiene:\n\t#{ht[:n_paragrafi]} paragrafi\n\t#{ht[:n_parole]} parole\n\t#{ht[:n_caratteri]} caratteri"
puts "_"*40




#__________________________________________________________________________
# 3. Giustificare il testo con una larghezza della pagina pari a
#__________________________________________________________________________
ht[:larghezza_testo] = 100 # numero di caratteri in una linea

# quando non posso aggiungere caratteri per completare la mia linea, 
# aggiungo spazi bianchi dopo ogni parola a partire da sinistra.
def riempi_stringa(str, lunghezza)
  raise ArgumentError, "Il primo argomento deve essere una stringa" unless str.is_a? String
  raise ArgumentError, "Il secondo argomento deve essere un intero" unless lunghezza.is_a? Integer

  l = str.size
  nsb = lunghezza-l # numero di spazi bianchi da aggiungere
  
  
  return str if nsb == 0
    
  par = str.chomp.split " "
  
  i = 1
  while nsb > 0
    # post poni uno spazio bianco alla fine di ogni parola
    par[i].insert(0, " ")
    i   += 1
    nsb -= 1
  end
  
  nuova_linea = par.join " "
  l = nuova_linea.size
  
  # se le parole nella linea sono meno degli spazi bianchi, 
  # aggiungo spazi bianchi dopo l'ultima parola 
  nsb = lunghezza-l # numero di spazi bianchi da aggiungere
  nuova_linea << " "*nsb
  
  l = nuova_linea.size
  begin
    msg = "La lunghezza della linea #{nuova_linea.inspect} di #{l} non e` compatibile con #{lunghezza}"
    raise RuntimeError, msg unless l == lunghezza
  rescue
    binding.pry
  end
  nuova_linea << "\n" # la linea deve andare accapo
  return nuova_linea
end # def


# Separo ogni parola in ogni paragrafo nel testo
testo_separato = []
ht[:testo].each{|par| testo_separato << par.split(" ") }

# Giustifico il testo. Ogni array (i.e. paragrafo) contiene le stringhe 
# giustificate (i.e. linee) separate da terminatori di stringa
ht[:testo_giustificato] = []
ht[:testo].each do |paragrafo|
  parole = paragrafo.split " "
  
  paragrafo_giustificato = ""

  linea = ""
  
  # fin tanto che non ho giustificato tutte le parole...
  while parole.size > 0
    # togli la parola dall'array 'parole' e mettila in 'p'
    p = parole.shift
    
    # devo aggiungere la parola alla linea solo se a valle di questa operazione
    # la conta dei caratteri non eccede ht[:larghezza_testo]
    linea_giustificata = linea + " " + p
    
    l = linea_giustificata.size
    
    if l < ht[:larghezza_testo]
      linea = linea_giustificata
      
      # se la linea e` abbastanza corta e ho finito le parole nel paragrafo,
      # allora appendi la linea al paragrafo cosi` com'e`
      if parole.size == 0
        paragrafo_giustificato << linea << "\n"
        # reinizializza la linea
        linea = ""
      end
      
    else
      linea = riempi_stringa(linea, ht[:larghezza_testo])
      
      # aggiungo la linea al paragrafo
      paragrafo_giustificato << linea
      
      # reinizializza la linea con la parola che avanza dalla linea precedente
      linea = p
      
      # se 'p' e` l'ultima parola del paragrafo, mandala accapo
      paragrafo_giustificato << p << "\n" if parole.empty?
      
    end # if
  end # while parole
  
  paragrafo_giustificato << "\n"
  ht[:testo_giustificato] << paragrafo_giustificato
end # .each

puts "="*40
ht[:testo_giustificato].each{|par| puts par}


#__________________________________________________________________________
# 3. Salvare il testo giustificato in un nuovo file
#__________________________________________________________________________

File.open("testo_giustificato.txt", 'w') do |file|
  ht[:testo_giustificato].each{|par| file.puts par}
end