#include <stdio.h>
void przestaw(int tab[], int n);

int main()
{
	int tab[] = { 12, 10, 3, 5, 10, 13, 0, -11, -6, -12 };
	
	for(int i = 10; i > 1; i--)
		przestaw(tab, i);

	for (int i = 0; i < 10; i++)
	{
		printf("%d, ", tab[i]);
	}
	
	return 0;
}