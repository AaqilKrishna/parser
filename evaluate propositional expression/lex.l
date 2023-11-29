%{
#include "y.tab.h"
extern int yylval;
%}

%%
[0-1] { 
    yylval = atoi(yytext); 
    return num; 
}

"~" {
    return neg; 
}

"^" {
    return and; 
}

"v" {
    return or; 
}

"->" {
    return imply; 
}

"<->" {
    return biimply; 
}

. { 
    return yytext[0]; 
}

[\n] {
    return 0;
}
%%