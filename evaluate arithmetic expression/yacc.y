%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
void yyerror (char const *);
%}

%token num
%left '+' '-'
%left '*' '%' '/'
%right '^'
%right inc dec


%%
S: expr {printf("Result: %d\n",$$);}
;

expr: '('expr')' { $$ = $2; }
| expr'+'expr { $$ = $1 + $3; }
| expr'-'expr { $$ = $1 - $3; }
| expr'*'expr { $$ = $1 * $3; }
| expr'/'expr { $$ = $1 / $3; }
| expr'%'expr { $$ = $1 % $3; }
| expr'^'expr { $$ = pow($1,$3); }
| expr inc { $$ = $1 + 1; }
| expr dec { $$ = $1 - 1; }
| num { $$ = $1; }
;
%%

void yyerror (char const *s) {
    printf("Invalid arithmetic expression\n");
    exit(0);
}

int main() {
    printf("Enter arithmetic expression: ");
    yyparse();
    printf("Valid Expression\n");
    return 0;
}
