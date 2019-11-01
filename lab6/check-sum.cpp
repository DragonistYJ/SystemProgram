
#include<stdio.h>
/* Taken from 15-213 Lab 1 */
int bitCount(int x) {
 
    /* Sum 8 groups of 4 bits each */
    int m1 = 0x11 | (0x11 << 8);
    int mask = m1 | (m1 << 16);
    int s = x & mask;
    s += x>>1 & mask;
    s += x>>2 & mask;
    s += x>>3 & mask;
    /* Now combine high and low order sums */
    s = s + (s >> 16);
    printf("s=%x\n",s);

    /* Low order 16 bits now consists of 4 sums,
	each ranging between 0 and 8.
	Split into two groups and sum */
    mask = 0xF | (0xF << 8);
    s = (s & mask) + ((s >> 4) & mask);
    return (s + (s>>8)) & 0x3F;
}

int main()
{
	int y = 0x00ff00ff;//0x11110000;
    int bitsum = bitCount(y);
    printf("%d",bitsum);
	return 1;
}
