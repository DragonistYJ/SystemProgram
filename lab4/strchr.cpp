/*

#include <stdio.h>
#include <string.h>

#define MAXLINE_LEN 80

int main(int argc, char* argv[])
{
	char Buffer[MAXLINE_LEN];
	char* space;
	char* word;

	printf("Input> ");
	do {
		if (fgets(Buffer, MAXLINE_LEN, stdin) == NULL) break;
		word = Buffer;
		while (space = strchr(word, ' '))
		{
			*space = '\0';
			printf("%s\n", word);
			word = ++space;
			while (*word == ' ') word++;
		}
		if (strchr(word, '\n')) {
			printf("%sInput> ", word);
		}
		else {
			printf("%s\n", word);
		}
	} while (strncmp(Buffer, "exit", 4));
	return 0;
}

*/