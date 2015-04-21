#!/bin/sh

bison -d parser.y
flex lexer.l
bison -v parser.y
gcc lex.yy.c parser.tab.c codegen.c -w -o qc
rm parser.tab.* lex.yy.c parser.output