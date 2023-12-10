#!/bin/bash
flex lex.l
yacc -d yacc.y
gcc lex.yy.c y.tab.c -o network_visualizer
./network_parser input.txt > output.dot
dot -Tpng output.dot -o output.png

