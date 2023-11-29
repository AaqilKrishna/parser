%{
#include "y.tab.h"
extern int yylval;
%}

%%
[0-9]+ { 
    yylval = atoi(yytext); 
    return num; 
}

"<" {
    return lt; 
}

">" {
    return gt; 
}

"<=" {
    return leq; 
}

">=" {
    return geq; 
}

"==" {
    return eq; 
}

"!=" {
    return neq; 
}

. { 
    return yytext[0]; 
}

[\n] {
    return 0;
}
%%