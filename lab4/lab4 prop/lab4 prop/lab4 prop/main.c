#include <stdio.h>

unsigned short int* tablica_parzystych(unsigned short int tablica[], unsigned int* n);

int main()
{
	unsigned short int tablica[] = { 1, 2, 2, 3, 6, 8, 0, 3, 46 };
	unsigned int n = 9;
	unsigned short int* tablicaParz = tablica_parzystych(tablica, &n);
	if (tablicaParz == 0)
		return 0;
	for (int i = 0; i < n; i++)
		printf("%d, ", tablicaParz[i]);
	return 0;
}