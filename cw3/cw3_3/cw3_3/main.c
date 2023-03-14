#include <stdio.h>

void wyswietl64(unsigned __int64 a);

int main()
{
	unsigned __int64 i = 3855;
	unsigned __int64 j = 0x7FFFFFFFFFFFFFFF;
	wyswietl64(i);
	wyswietl64(j);
}