#!/usr/bin/env ruby
#-------------------------------------------------------------------------
#  Corso di Fondamenti di Informatica e Calcolo Numerico
#  AA 2013/2014 
#  
#  Esercitazioni in Laboratorio: e.6_gioco_vita_Conway.rb
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

=begin
Il gioco della vita è un famosissimo automa cellulare elaborato dal matematico
John Conway negli anni sessanta. Si tratta sostanzialmente di una griglia
costituita da celle e ognuna di esse può essere o viva o morta(piena o vuota).
Data una situazione iniziale della griglia, le successive iterazioni
dell’algoritmo seguono delle regole semplicissime per decidere quali celle si
devono accendere( nascere o continuare a vivere ) e quali spegnere( morire ), a
seconda del numero di “vicini” che si trovano nel quadrato 3×3 con centro nella
cella considerata

implementazione in C:
  http://barcadero.wordpress.com/2011/03/06/programmare-il-gioco-della-vita-di-conway/
=end

require 'pry'

LARGHEZZA_GRIGLIA = 100
ALTEZZA_GRIGLIA   = 40

LARGHEZZA_CELLA   = 1
ALTEZZA_CELLA     = 1

CELLE_PER_RIGA    = LARGHEZZA_GRIGLIA/LARGHEZZA_CELLA
CELLE_PER_COLONNA = ALTEZZA_GRIGLIA/ALTEZZA_CELLA

VIVA   = true
MORTA  = false

SYMBOL = "*"

# numero di millisecondi tra iterazioni successive
RITARDO = 30

@griglia_vecchia = []

def reset_terminal
  case RUBY_PLATFORM
  when /darwin/
    system "clear"
  #when /mingw|mswin/
    #puts "Not implemented for windows"
  when /linux/
    system "clean"
  end
end


def init_griglia(default = MORTA)
  mat = []
  CELLE_PER_COLONNA.times do
    ary = []
    CELLE_PER_RIGA.times do
      ary << default
    end
    mat << ary
  end
  return mat
end


def riempi_griglia_random(griglia)  
  # riempio la griglia con dei 'true' e 'false' generati casualmente. La probabilità che il valore casuale sia 'true' è impostata da p_true
  p_true = 0.1 # probabilità di avere 'true' del 10 %
      
  for i in 0..CELLE_PER_COLONNA-1
    for j in 0..CELLE_PER_RIGA-1
      griglia[i][j] = rand < p_true
    end
  end
  
  return griglia
end





def inserisci_blocco(i,j,game)
  raise "Impossibile inizializzare il blocco" if i > CELLE_PER_COLONNA-2 || j > CELLE_PER_RIGA-2
  
  game[:griglia][i][j]     = VIVA
  game[:griglia][i+1][j]   = VIVA
  game[:griglia][i][j+1]   = VIVA
  game[:griglia][i+1][j+1] = VIVA
end

def inserisci_astronave_leggera(i,j,game, direzione = :sx)
  raise "Impossibile inizializzare il blocco" if i > CELLE_PER_COLONNA-4 || j > CELLE_PER_RIGA-5
   
  case direzione
  when :sx
    game[:griglia][i][j]     = MORTA
    game[:griglia][i][j+1]   = VIVA
    game[:griglia][i][j+2]   = MORTA
    game[:griglia][i][j+3]   = MORTA
    game[:griglia][i][j+4]   = VIVA
    
    game[:griglia][i+1][j]   = VIVA
    game[:griglia][i+1][j+1] = MORTA
    game[:griglia][i+1][j+2] = MORTA
    game[:griglia][i+1][j+3] = MORTA
    game[:griglia][i+1][j+4] = MORTA
    
    game[:griglia][i+2][j]   = VIVA
    game[:griglia][i+2][j+1] = MORTA
    game[:griglia][i+2][j+2] = MORTA
    game[:griglia][i+2][j+3] = MORTA
    game[:griglia][i+2][j+4] = VIVA
                    
    game[:griglia][i+3][j]   = VIVA
    game[:griglia][i+3][j+1] = VIVA
    game[:griglia][i+3][j+2] = VIVA
    game[:griglia][i+3][j+3] = VIVA
    game[:griglia][i+3][j+4] = MORTA
  when :dx
    game[:griglia][i][j+4]   = MORTA
    game[:griglia][i][j+3]   = VIVA
    game[:griglia][i][j+2]   = MORTA
    game[:griglia][i][j+1]   = MORTA
    game[:griglia][i][j]     = VIVA
    
    game[:griglia][i+1][j+4] = VIVA
    game[:griglia][i+1][j+3] = MORTA
    game[:griglia][i+1][j+2] = MORTA
    game[:griglia][i+1][j+1] = MORTA
    game[:griglia][i+1][j]   = MORTA
    
    game[:griglia][i+2][j+4] = VIVA
    game[:griglia][i+2][j+3] = MORTA
    game[:griglia][i+2][j+2] = MORTA
    game[:griglia][i+2][j+1] = MORTA
    game[:griglia][i+2][j]   = VIVA
                    
    game[:griglia][i+3][j+4] = VIVA
    game[:griglia][i+3][j+3] = VIVA
    game[:griglia][i+3][j+2] = VIVA
    game[:griglia][i+3][j+1] = VIVA
    game[:griglia][i+3][j]   = MORTA
  else
    raise ArgumentError, "Direzione della nave sbagliata"
  end
    
end


# TODO AGGIUNGERE ALTRE FIGURE DA:
# http://it.wikipedia.org/wiki/Gioco_della_vita






def conta_vicini(i,j,game)
  vicini = 0
  
  #### BORDI RIGIDI
  #if i > 0
  #  vicini += 1 if game[:griglia][i-1][j]
  #end
  #if i > 0 && j > 0
  #  vicini += 1 if game[:griglia][i-1][j-1]
  #end
  #if i > 0 && j < CELLE_PER_RIGA
  #  vicini += 1 if game[:griglia][i-1][j+1]
  #end
  #if j > 0
  #  vicini += 1 if game[:griglia][i][j-1]
  #end
  #if j <  CELLE_PER_RIGA-1
  #  vicini += 1 if game[:griglia][i][j+1]
  #end
  #if i < CELLE_PER_COLONNA-1 && j > 0
  #  vicini += 1 if game[:griglia][i+1][j-1]
  #end
  #if i < CELLE_PER_COLONNA-1
  #  vicini += 1 if game[:griglia][i+1][j]
  #end
  #if i < CELLE_PER_COLONNA-1 && j < CELLE_PER_RIGA-1
  #  vicini += 1 if game[:griglia][i+1][j+1]
  #end
  
  #======================================================
  ### BORDI RICORSIVI
  i += CELLE_PER_COLONNA if i-1 < 0
  j += CELLE_PER_RIGA    if j-1 < 0
  i -= CELLE_PER_COLONNA if i+1 >= CELLE_PER_COLONNA
  j -= CELLE_PER_RIGA    if j+1 >= CELLE_PER_RIGA
  
  vicini += 1 if game[:griglia][i-1][j]
  vicini += 1 if game[:griglia][i-1][j-1]
  vicini += 1 if game[:griglia][i-1][j+1]
  vicini += 1 if game[:griglia][i][j-1]
  vicini += 1 if game[:griglia][i][j+1]
  vicini += 1 if game[:griglia][i+1][j-1]
  vicini += 1 if game[:griglia][i+1][j]
  vicini += 1 if game[:griglia][i+1][j+1]
    
  return vicini
end



def cella_vive(i, j, game)
  if i < 0 || i > (CELLE_PER_COLONNA-1) || j < 0 || j > (CELLE_PER_RIGA-1)
    return MORTA
  end
  
  if game[:griglia][i][j] == MORTA
    puts "Attenzione, cella_vive() chiamato su cella morta!"
    return MORTA
  end
  
  # conta i vicini
  vicini = conta_vicini(i,j,game)
  
  # return (vicini == 2 || vicini == 3)
  if (vicini == 2 || vicini == 3)
    return true
  else
    return false
  end
end




def cella_diventa_viva(i, j, game)
  vicini = 0
  
  if i < 0 || i > CELLE_PER_COLONNA-1 || j < 0 || j > CELLE_PER_RIGA-1
    puts "Attenzione! in 'cella_diventa_viva' gli indici vanno oltre i valori ammessi"
    return VIVA
  end

  if game[:griglia][i][j] == VIVA
    puts "Attenzione, cella_vive() chiamato su cella già viva!"
    return VIVA
  end
    
  vicini = conta_vicini(i,j,game)
  
  return vicini == 3
end





def prossimo_passo(game)
  griglia_aux = init_griglia MORTA
    
  # calcola celle che sopravvivono
  for i in 0..CELLE_PER_COLONNA-1
    for j in 0..CELLE_PER_RIGA-1
      if game[:griglia][i][j] == VIVA
        griglia_aux[i][j] = cella_vive(i,j,game) ? VIVA : MORTA
      else
        griglia_aux[i][j] = cella_diventa_viva(i,j,game) ? VIVA : MORTA
      end # if
    end # for j
  end # for i
  
  # copia griglia_aux nel game
  game[:griglia] = griglia_aux.dup
end



def plot_griglia(mat)
  str = "_"*(CELLE_PER_RIGA+1) + "\n"
  
  for i in 0 .. CELLE_PER_COLONNA-1
    str +="|"
    for j in 0 .. CELLE_PER_RIGA-1
      simbolo = mat[i][j] == VIVA ? SYMBOL : " "
      str += simbolo
    end
    str += "|\n"
  end
  str += "_"*(CELLE_PER_RIGA+1)
  puts str
end


def itera(game)
  finito = false
  
  iterazione = 0
  
  while !finito
    sleep 1e-3*RITARDO
    reset_terminal
    
    prossimo_passo(game)
    
    finito = true if (iterazione % 3) == 0 && @griglia_vecchia == game[:griglia]
    
    iterazione += 1
    puts "Iterazione #{iterazione}"
    
    plot_griglia game[:griglia]
    
    @griglia_vecchia = game[:griglia].dup
    
  end
  
end


# TODO: fargli fare l'avanzamento manuale delle iterazioni

if __FILE__ == $0
  
  griglia_vuota = init_griglia
  
  # Inizializza il gioco come una hash
  gioco = {
    # le celle nella griglia hanno valore booleano (vero/falso), e sono tutte inizializzate a 'falso'
    :griglia => griglia_vuota,
  
    :config_griglia => {
      :righe   => ALTEZZA_GRIGLIA,
      :colonne => LARGHEZZA_GRIGLIA
    },
  
    :config_cella  => {
      :altezza => ALTEZZA_CELLA, 
      :larghezza => LARGHEZZA_CELLA
    }
  }
  
  #inserisci_blocco 3,4, gioco
  inserisci_astronave_leggera 4, 30, gioco, :sx
  inserisci_astronave_leggera 4,  6, gioco, :dx
  inserisci_astronave_leggera 36, 80, gioco, :dx
  inserisci_astronave_leggera 30, 60, gioco, :sx  
  inserisci_astronave_leggera 30, 80, gioco, :sx  
  inserisci_astronave_leggera 10, 10, gioco, :dx  
  #griglia = riempi_griglia_random( griglia_vuota )
  
  reset_terminal
  itera gioco
  
end