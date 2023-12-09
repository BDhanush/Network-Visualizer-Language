%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

%}

%union {
    int num;
    char *str;
}

%token NODE
%token CONNECT
%token DISCONNECT
%token MANIPULATE
%token <num> NUMBER
%token <str> ID

%%

commands:
    | commands command
    ;

command:
    NODE ID { printf("%s [label=\"%s\"];\n", $2, $2); }
    | CONNECT ID ID { printf("%s -- %s;\n", $2, $3); }
    | DISCONNECT ID ID { printf("%s -- %s [constraint=false];\n", $2, $3); }
    | MANIPULATE NUMBER ID { printf("%s [label=\"%s\\n%d\"];\n", $3, $3, $2); }
    ;

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s input.txt > output.dot\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror(argv[1]);
        return 1;
    }

    printf("graph G {\n");
    yyparse();
    printf("}\n");

    fclose(yyin);

    return 0;
}
