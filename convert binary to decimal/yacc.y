%{ 
#include<stdio.h> 
#include<stdlib.h> 
int yylex(void);
void yyerror(char const *);
%}

%token num

%%
S: A { printf("Decimal Number: %d\n", $$); } 

A: A num { $$=$1*2+$2; } 
| num { $$=$1; } 
;
%% 

void yyerror(char const *s) { 
	printf("Invalid");
	exit(0);
} 

int main() { 
	printf("Binary Number: ");
	yyparse(); 
	return 0;
}