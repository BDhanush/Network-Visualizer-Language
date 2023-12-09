%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s) 
{
    fprintf(stderr, "Error: %s\n", s);
}

%}

%union 
{
    int num;
    char *str;
}

%token TITLE
%token NODE
%token CONNECT
%token LABEL
%token COLOR
%token WEIGHT
%token <num> NUMBER
%token <str> STR

%%

commands:
    | commands command
    ;

command:
    '='
    | TITLE '=' STR { printf("label=\"%s\";\n", $3); }
    | NODE STR { printf("%s [label=\"%s\"];\n", $2, $2); }
    | NODE STR NUMBER { printf("%s [label=\"%s\\n%d\"];\n", $2, $2, $3); }
    | NODE STR COLOR '=' STR { printf("%s [color=\"%s\"];\n", $2, $5); }
    | CONNECT STR STR { printf("%s -- %s;\n", $2, $3); }
    | CONNECT STR STR COLOR '=' STR { printf("%s -- %s [color=\"%s\"];\n", $2, $3, $6); }
    | CONNECT STR STR WEIGHT '=' NUMBER { printf("%s -- %s [weight=%d][label=\"w=%d\"];\n", $2, $3, $6, $6); }
    | LABEL STR NUMBER { printf("%s [label=\"%s\\n%d\"];\n", $2, $2, $3); }
    ;

%%

int main(int argc, char **argv) 
{
    if (argc < 2) 
    {
        fprintf(stderr, "Usage: %s input.txt > output.dot\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) 
    {
        perror(argv[1]);
        return 1;
    }

    printf("strict graph G {\n");
        yyparse();
    printf("}\n");

    fclose(yyin);

    return 0;
}
