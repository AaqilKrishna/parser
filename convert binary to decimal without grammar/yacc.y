%{ 
#include<stdio.h> 
#include<stdlib.h> 
#include<math.h>
int yylex(void);
void yyerror(char const *);
int binaryToDecimal(int);
%}

%token num

%%
S: num {
	printf("Decimal Number: %d\n", binaryToDecimal($1)); 
}
%% 

void yyerror(char const *s) { 
	printf("Invalid");
	exit(0);
} 

int binaryToDecimal(int bin) {
	int dec = 0, i = 0, rem;

	printf("Binary Number: %d\n", bin);

	while (bin != 0) {
		rem = bin % 10;
		bin /= 10;
		dec += rem * pow(2, i);
		++i;
	}
	return dec;
}

int main() { 
	printf("Binary Number: ");
	yyparse(); 
	return 0;
}