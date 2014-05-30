/*-------------------------------------------------------------------------
  Esercitazioni in Laboratorio per il Corso di                           
  Fondamenti di Informatica e Calcolo Numerico, AA 2013/2014             
                                                                         
  Autori:   Enrico Bertolazzi e Carlos Maximiliano Giorgio Bort          
            Dipartimento di Ingeneria Industriale, Universita` di Trento 
  Sito web: http://www.ing.unitn.it/~bertolaz/                           
                                                                         
  Contatti: enrico.bertolazzi@unitn.it, cm.giorgiobort@unitn.it          
                                                                         
  Copyright (c) 2014 E.Bertolazzi e C.M. Giorgio Bort                    
-------------------------------------------------------------------------*/

/* Per compilare il sorgente aprire il terminale e scrivere

	> gcc -o 2_hanoi 2_hanoi.c 

Per eseguire il file compilato digitare

	> ./2_hanoi

*/

#include <stdio.h>

void hanoi(
	const unsigned int n,
	      unsigned int da,
		  unsigned int verso,
		  unsigned int via
)
{
	if(n>0)
	{
		hanoi(n-1, da, via, verso);
		printf("Muovo disco %u, dal palo %u al palo %u\n", n, da, verso);
		hanoi(n-1, via, verso, da);
	}
		
}


int main()
{
	unsigned int ndischi = 3;
	
	hanoi(ndischi, 0, 2, 1);
	return 0;
}