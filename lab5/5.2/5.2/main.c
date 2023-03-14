#include <stdio.h>

float nowy_exp(float x);
float spr(float x)
{
	int dzielnik;
	float suma = 1;
	float wynik_posr;
	for (int i = 1; i < 20; i++)
	{
		dzielnik = 1;
		wynik_posr = 1;
		for (int j = 1; j <= i; j++)
			dzielnik *= j;
		for (int j = 0; j < i; j++)
			wynik_posr *= x;
		suma += wynik_posr / dzielnik;
	}
	return suma;
}

int main()
{
	float suma_szeregu = nowy_exp(2.3);
	float test_suma = spr(2.3);

	printf("%f %f", suma_szeregu, test_suma);
	return 0;
}