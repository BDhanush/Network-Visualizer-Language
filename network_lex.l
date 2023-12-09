%{

#include "y.tab.h"

%}

%%

[ \t(\r\n|\r|\n)]       ; /* Ignore whitespace */
"title"                 { return TITLE; }
"node"                  { return NODE; }
"connect"               { return CONNECT; }
"addLabelNum"           { return LABEL; }
"color"                 { return COLOR; }
"weight"                { return WEIGHT; }
(=)                     { return '='; }
[0-9]+                  { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.str = strdup(yytext); return STR; }

.                       { return yytext[0]; }  /*Any other character is returned as is */

%%

int yywrap() 
{
    return 1;
}
