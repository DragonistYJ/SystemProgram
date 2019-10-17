#include <stdio.h>

void swap1(int x, int y) { 
	int temp; 
	temp=x; 
	x=y; 
	y=temp; 
} 

void swap2(int* x, int* y) { 
	int temp; 
	temp=*x; 
	*x=*y; 
	*y=temp; 
}
 
int main() { 
	int a=1,b=2; 
	swap1(a,b); 
	printf("after swap1,a=%d, b=%d\n",a,b); 
	swap2(&a,&b); 
	printf("after swap1,a=%d, b=%d\n",a,b); 
} 