%{
#include "y.tab.h"
extern int yylval;
%}

%%
[0-1]+ { 
    yylval = atoi(yytext); 
    return num; 
}

"&&" {
    return and; 
}

"||" {
    return or; 
}

"!" {
    return not; 
}

. { 
    return yytext[0]; 
}

[\n] {
    return 0;
}
%%