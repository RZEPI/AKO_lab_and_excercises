#include <stdio.h>
#include <xmmintrin.h>

void wyswietl128( __m128 a);

int main()
{
	__m128 liczba;
	liczba.m128_u64[0] = 0xFFFFFFFFFFFFFFFF;
	liczba.m128_u64[1] = 0xFFFFFFFFFFFFFFFF;

	wyswietl128(liczba);
	return 0;
}