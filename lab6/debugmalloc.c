#include <stdlib.h>
#include <string.h>
#include "debugmalloc.h"
#include "dmhelper.h"
#include <stdio.h>
#define FENCE 0xCCDEADCC

typedef struct header {
	int size;
	char* filename;
	int linenum;
	struct header* next;
	int checknum;
}header;
static header* head = NULL;
static header* tail = NULL;

/* init the linked list
	add the header node if list has no element */
void initList() {
	if (head != NULL) {
		return;
	}

	head = malloc(sizeof(struct header));
	head->next = NULL;
	tail = head;
	return;
}

int getCheckSum(int x) {
    int sum=0;
	int bitsnum=sizeof(int)*8;
	int andbit=1;

	do{
		if(x & andbit){
			++sum;
		}
		andbit <<=1;
		--bitsnum;
	}while(bitsnum>0);
	
	return sum;
}

/* Wrappers for malloc and free */
void *MyMalloc(size_t size, char *filename, int linenumber) {
	header* node = NULL;
	initList();

	node = (header *)malloc(sizeof(header) + sizeof(FENCE) * 2 + size);
	node->size = size;
	node->filename = filename;
	node->linenum = linenumber;

	*((int *)node + sizeof(header)/4) = FENCE;
	*((int *)((char *)node + sizeof(header) + sizeof(FENCE) + size)) = FENCE;
	
	tail->next = node;
	tail = node;
	tail->next = NULL;

	node->checknum = getCheckSum(linenumber);

	return (int *)node + sizeof(header) /4 + sizeof(FENCE) /4;
}

void MyFree(void *ptr, char *filename, int linenumber) {
	header* p = (header *)((int *)ptr - sizeof(header) /4 - sizeof(FENCE) /4);
	header* pre = head;
	header* next = NULL;

	if (head == NULL) {
		error(4, filename, linenumber);
	}

	next =  pre->next;
	
	while (next != NULL) {
		if (next == p) {
			break;
		} else {
			pre = next;
			next = pre->next;
		}
	}

	if (next == NULL) {
		error(4, filename, linenumber);
	}
	if (*((int *)next + sizeof(header)/4) != FENCE) {
		errorfl(1, next->filename, next->linenum, filename, linenumber);
	}
	if (*((int *)((char *)next + sizeof(header) + sizeof(FENCE) + next->size)) != FENCE) {
		errorfl(2, next->filename, next->linenum, filename, linenumber);
	}
	if (next->checknum != getCheckSum(next->linenum)) {
		errorfl(3, next->filename, next->linenum, filename, linenumber);
	}

	pre->next = next->next;
	free(next);
}

/* returns number of bytes allocated using MyMalloc/MyFree:
	used as a debugging tool to test for memory leaks */
int AllocatedSize() {
	int sum = 0;
	header* p = head->next;

	if (head == NULL) {
		return 0;
	}

	while (p != NULL) {
		sum += p->size;
		p = p->next;
	}
	return sum;
}



/* Optional functions */

/* Prints a list of all allocated blocks with the
	filename/line number when they were MALLOC'd */
void PrintAllocatedBlocks() {
	header* p = head->next;

	if (head == NULL) {
		return;
	}
	
	if (p) {
		printf("Currently allocated blocks:");   
	}

	while (p != NULL) {
		PRINTBLOCK(p->size, p->filename, p->linenum);
		p = p->next;
	}

	return;
}

/* Goes through the currently allocated blocks and checks
	to see if they are all valid.
	Returns -1 if it receives an error, 0 if all blocks are
	okay.
*/
int HeapCheck() {
	header* p = head->next;
	int status = 0;

	if (head == NULL) {
		return -1;
	}
	
	while (p != NULL) {
		if (*((int *)p + sizeof(header)/4) != FENCE) {
			PRINTERROR(1, p->filename, p->linenum);
			status= 1;
		}
		if (*((int *)((char *)p + sizeof(header) + sizeof(FENCE) + p->size)) != FENCE) {
			PRINTERROR(2, p->filename, p->linenum);
			status = 1;
		}
		if (p->checknum != getCheckSum(p->linenum)) {
			PRINTERROR(3, p->filename, p->linenum);
			status = 1;
		}
		
		p = p->next;
	}

	return status;
}
