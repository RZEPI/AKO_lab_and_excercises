#include <stdio.h>

float srednia_harm(float* tablica, unsigned int n);


int main()
{
	float tab[] = { 1.3, 4.3, 5.6, 7.6, 9.1 };
	int n = 5;
	float srednia;
	srednia = srednia_harm(tab, n);
	printf("%f", srednia);
	return 0;
}