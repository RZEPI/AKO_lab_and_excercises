#include <stdio.h>
extern __int64 suma_siedmiu_liczb(__int64 v1, __int64 v2, __int64 v3, __int64 v4, __int64 v5, __int64 v6, __int64 v7 );
int main()
{
	__int64 suma=suma_siedmiu_liczb(-7, -2, -3, -1, -5, -4, -10); //20
	printf("%ld", suma);
	return 0;
}