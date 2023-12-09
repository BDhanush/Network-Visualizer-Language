#!/bin/bash
flex network_lex.l
yacc -d network_yacc.y
gcc lex.yy.c y.tab.c -o network_parser
./network_parser input.txt > output.dot
dot -Tpng output.dot -o output.png

