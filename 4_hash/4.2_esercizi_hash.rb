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

# A) Usare le hash per costruire un elenco telefonico
elenco = [
  {:nome    => "Carlo", 
   :cognome => "Rossi",
   :numero  => 1231231230,
   :mail    => 'carlo.rossi@mail.it'},
  {:nome    => "Stefan",
   :cognome => "Benz",
   :numero  => 22211223,
   :mail    => 'ste123@mail.de'},
  {:nome    => "Maria",
   :cognome => "Callas",
   :numero  => 444001231,
   :mail    => 'callas@mail.com'}
]








# A.1) Per ogni persona nell'elenco, farsi stampare
#      sul terminale la descrizione, formattata come:
#  "NOME COGNOME: tel. NUMERO , mail MAIL"
puts "Esempio 1"
 
elenco.each do |elem|
  # elem contiene la hash i-esime del array elenco
  # dove i va da 0 a elenco.length-1
  # estraggo valori della hash
  n   = elem[:nome]
  c   = elem[:cognome]
  tel = elem[:numero]
  m   = elem[:mail]
  # stampo come richiesto
  puts "#{n} #{c}: tel. #{tel}, mail #{m}"
end






# A.2) Farsi stampare sul terminale la descrizione di ogni
#      contatto nell'elenco telefonico (come nell'es. A.1),
#      ma ordinando i cognomi in ordine alfabetico
#
# MODO COMPLICATO
#
# step 1, extraggo i cognomi e li riordino.
# Il metodo collect cotruisce un Array iterando sugli elementi del vettore
cognomi = elenco.collect { |elem| elem[:cognome] }
cognomi.sort! # il metodo sort riordina l'array
 
# step 2, costruisco una mappa che dal cognome trova
# la posizione nel vettore elenco
map_to_position = {}
elenco.each_with_index { |elem,i| map_to_position[elem[:cognome]] = i }
# each_with_index oltre che a prendere l'elemento 
# aggiunge un secondo argomento con la sua posizione
 
# step 3, stampa lista ordinata
puts "Esempio 2"
cognomi.each do |c| # c contiene il cognome
  pos = map_to_position[c] # dal cognome trovo la posizione
  elem = elenco[pos] # prendo la Hash dall'elenco
  # stampo come richiesto
  puts "#{elem[:nome]} #{elem[:cognome]}: tel. #{tel = elem[:numero]}, mail #{elem[:mail]}"
end 
 
#
# MODO SEMPLICE
#
# riordino il vettore elenco, non posso usare elenco.sort!
# perche sort! non sa come confrontare 2 hash
# devo quindi indicare all'interprete come 
# confrontare sue hash
elenco.sort! { |a,b| a[:cognome] <=> b[:cognome] }
# il blocco {} restituisce 
# -1 se a <  b (secondo le nostre regole)
#  0 se a == b (secondo le nostre regole)
# +1 se a >  b (secondo le nostre regole)
# l'operatore <=> applicato a 2 stringhe s1 e s2 restituisce
# -1 se s1 < s2, 0 se s1 == s2 ed +1 se s1 > s2
 
puts "Esempio 3"
elenco.each do |elem|
  # elem contiene la hash i-esime del array elenco
  # dove i va da 0 a elenco.length-1
  # stampo come richiesto
  puts "#{elem[:nome]} #{elem[:cognome]}: tel. #{tel = elem[:numero]}, mail #{elem[:mail]}"
end
