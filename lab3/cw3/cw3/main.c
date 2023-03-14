#include <stdio.h>
void wysiwetl32(int a);

int main()
{
	int a = 123;
	int b = 0xFFFFFFFF;
	wysiwetl32(a);
	wysiwetl32(b);
	return 0;
}