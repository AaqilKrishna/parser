%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
int val;
%}

%%
[abck] {
    printf("Enter value of %c: ", yytext[0]);
    scanf("%d", &val);
    yylval = val;
    return num;
}

"++" {
    return inc;
}

"--" {
    return dec;
}

. {
    return yytext[0];
}

[\n] {
    return 0;
}
%%