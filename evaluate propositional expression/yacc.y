%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
void yyerror(char const *);
%}

%token num
%left biimply
%left imply
%left or
%left and
%left neg

%%
S: E {printf("Result: %d\n", $$);}
;

E: '('E')' { $$ = $2; }
| neg E { $$ = !($2); }
| E and E { $$ = ($1) && ($3); }
| E or E { $$ = ($1) || ($3); }
| E imply E { $$ = ($1 == 1 && $3 == 0)? 0:1; }
| E biimply E { $$ = ($1 == $3)? 1:0; }
| num { $$ = $1; }
;
%%

void yyerror (char const *s) {
    printf("Invalid propositional expression\n");
    exit(0);
}

int main() {
    printf("Enter propositional expression: ");
    yyparse();
    printf("Valid propositional Expression\n");
    return 0;
}