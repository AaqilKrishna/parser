%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
void yyerror(char const *);
%}

%token num lt gt eq neq leq geq
%left eq neq
%left lt gt leq geq

%%
S: E {printf("Result: %d\n", $$);}
;

E: '('E')' { $$ = $2;}
| E lt E { $$ = ($1 < $3);}
| E gt E { $$ = ($1 > $3);}
| E leq E { $$ = ($1 <= $3);}
| E geq E { $$ = ($1 >= $3);}
| E eq E { $$ = ($1 == $3);}
| E neq E { $$ = ($1 != $3);}
| num { $$ = $1;}
;
%%

void yyerror (char const *s) {
    printf("Invalid relational expression\n");
    exit(0);
}

int main() {
    printf("Enter relational expression: ");
    yyparse();
    printf("Valid relational expression\n");
    return 0;
}
