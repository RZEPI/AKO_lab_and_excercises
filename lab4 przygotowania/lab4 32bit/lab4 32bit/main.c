#include <stdio.h>

unsigned int* tablica_parzystych(unsigned int tablica[], unsigned int* n);

int main()
{
	unsigned int tablica[] = { 1, 2, 3, 4, 5, 6, 7, 8 };
	unsigned int n = 8;
	unsigned int tablicaParz[] = tablica_parzystych(tablica, n);
	for(int i = 0; i < 4; i++)
		printf("%d", tablicaParz[n])
	return 0;
}