%{
#include "y.tab.h"
%}

%%

[ \t(\r\n|\r|\n)]             ; /* Ignore whitespace */
"node"              { return NODE; }
"connect"           { return CONNECT; }
"disconnect"        { return DISCONNECT; }
"manipulate"        { return MANIPULATE; }
[0-9]+              { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; }

.                   { return yytext[0]; }  /*Any other character is returned as is */

%%

int yywrap() {
    return 1;
}
