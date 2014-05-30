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

	> gcc -o 1_hello_world 1_hello_world.c 

Per eseguire il file compilato digitare

	> ./1_hello_world

*/


#include <stdio.h>

int main()
{
	unsigned int ary[5];
	//ary = {11,22,33,44,55}; // NON E' VALIDA
	ary[0] = 65535*65535;
	ary[1] = 22;
	ary[2] = 33;
	ary[3] = 44;
	ary[4] = 55;
	
	for(unsigned int i = 0; i<5; i++)
	{
		printf("%u ", ary[i]);
	}
	printf("\n");
	
	char str[] = "hello world";
	for(unsigned int i = 0; i<11; i++)
	{
		printf("%c", str[i]);
	}
	printf("\n");
	
	
	return(0);
}


/* Corrispettivo Ruby:
	
	ary = [11,22,33,44,55]
	p ary
*/