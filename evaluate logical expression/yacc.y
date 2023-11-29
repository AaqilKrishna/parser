%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
void yyerror(char const *);
%}

%token num
%left not
%left and
%left or

%%
S: E {printf("Result: %d\n", $$);}
;

E: '('E')' { $$ = $2;}
| not E { $$ = !($2);}
| E and E { $$ = ($1) && ($3);}
| E or E { $$ = ($1) || ($3);}
| num { $$ = $1;}
;
%%

void yyerror (char const *s) {
    printf("Invalid logical expression\n");
    exit(0);
}

int main() {
    printf("Enter logical expression: ");
    yyparse();
    printf("Valid logical Expression\n");
    return 0;
}