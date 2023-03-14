#include <stdio.h>

void liczby(char*, char*, char*);

int main()
{
	char liczby_A[16] = { -128, -127, -126, -125, -124, -123, -122, -121, 120, 121, 122, 123, 124, 125, 126, 127 };
	char liczby_B[16] = { -3, -3, -3, -3, -3, -3, -3, -3, 3, 3, 3, 3, 3, 3, 3, 3 };

	char l[16];
	liczby(liczby_A, liczby_B, l);
	for (int i = 0; i < 16; i++)
		printf("%c, ", l[i]);
	return 0;
}