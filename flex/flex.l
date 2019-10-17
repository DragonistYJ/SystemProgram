%option noyywrap

letter [a-z]|[A-Z]
digit [0-9]
space [ \t\n\r]+

ELSE else
IF if
INT int
RETURN return
VOID void
WHILE while
ADD \+
SUB  \-
MUL  \*
QUO  \/
EQL     ==
LSS     <
GTR     >
NEQ       !=
LEQ       <=
GEQ       >=
ASS		=
LPAREN  \(
LBRACK  \[
LBRACE  \{
COMMA   ,
PERIOD  \.
RPAREN     \)
RBRACK     \]
RBRACE     \}
SEMICOLON  ;
LAN	\/\*
RAN \*\/

%%
{ELSE}		printf("<Key Word, %s>\n",yytext);
{IF}			printf("<Key Word, %s>\n",yytext);
{INT}			printf("<Key Word, %s>\n",yytext);
{RETURN}		printf("<Key Word, %s>\n",yytext);
{VOID}		printf("<Key Word, %s>\n",yytext);
{WHILE}		printf("<Key Word, %s>\n",yytext);

{ADD}			printf("<Symbol, %s>\n",yytext);
{SUB}			printf("<Symbol, %s>\n",yytext);
{MUL}		printf("<Symbol, %s>\n",yytext);
{QUO}		printf("<Symbol, %s>\n",yytext);
{LSS}			printf("<Symbol, %s>\n",yytext);
{LEQ}		printf("<Symbol, %s>\n",yytext);
{GTR}			printf("<Symbol, %s>\n",yytext);
{GEQ}		printf("<Symbol, %s>\n",yytext);
{EQL}		printf("<Symbol, %s>\n",yytext);
{NEQ}		printf("<Symbol, %s>\n",yytext);
{ASS}			printf("<Symbol, %s>\n",yytext);
{SEMICOLON}			printf("<Symbol, %s>\n",yytext);
{COMMA}		printf("<Symbol, %s>\n",yytext);
{LPAREN}			printf("<Symbol, %s>\n",yytext);
{RPAREN}			printf("<Symbol, %s>\n",yytext);
{LBRACK}			printf("<Symbol, %s>\n",yytext);
{RBRACK}			printf("<Symbol, %s>\n",yytext);
{LBRACE}			printf("<Symbol, %s>\n",yytext);
{RBRACE}			printf("<Symbol, %s>\n",yytext);
{PERIOD}			printf("<Symbol, %s>\n",yytext);
{LAN}		printf("<Symbol, %s>\n",yytext);
{RAN}		printf("<Symbol, %s>\n",yytext);

{space}	printf("<Space>\n");
{LAN}({letter}*{space}*{SUB}*{QUO}*{MUL}*{EQL}*{LSS}*{GTR}*{NEQ}*{LEQ}*{GEQ}*{ASS}*{LPAREN}*{LBRACK}*{LBRACE}*{COMMA}*{PERIOD}*{RPAREN}*{RBRACK}*{RBRACE}*{SEMICOLON}*)*{RAN} printf("<Annotation, %s>\n",yytext);

{letter}+	printf("<ID, %s>\n",yytext);
{digit}+	printf("<NUM, %s>\n",yytext);
%%

int main(int argc, char** argv)
{
    --argc;
    ++argv;
    if(argc > 0)
        yyin = fopen(argv[0],"r");
    else
        yyin = stdin;
    
    yylex();
    system("pause");
}