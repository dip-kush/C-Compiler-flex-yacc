%option noyywrap

%{
#include<stdio.h>
#include<string.h>
#include "y.tab.h"
int count=0,cmnt_line=0,count_lines=0;
  

%}

%x CMNT
UCN       (\\u[0-9a-fA-F]{4}|\\U[0-9a-fA-F]{8})
DIGIT     [0-9]
LETTER    [A-Za-z]
DELIMITER [ \t\n]
IDENTIFIER {LETTER}({LETTER}|{DIGIT}|_)*
INTEGER 0|([1-9][0-9]*)
FLOATING {INTEGER}*{.?}{INTEGER}+
STRING    L?\"([^"\\]|\\['"?\\abfnrtv]|\\[0-7]{1,3}|\\[Xx][0-9a-fA-F]+|{UCN})*\"

%%
    /* match identifier */
\n 
"/*" {BEGIN CMNT;}
<CMNT>. {;}
<CMNT>\n {cmnt_line++;}
<CMNT>[/][*]([^*]|[*]*[^*/])*[*]+[/] {cmnt_line++;}
<CMNT>"*/" {BEGIN INITIAL; cmnt_line++;}

	/* rules for operator and punctuations */
"+"         { printf("%d\n", PLUS); }
"-"             { printf("%d\n", MINUS); }
"*"         { printf("%d\n", MULT); }
"/"         { printf("%d\n", DIV); }
"%"         { printf("%d\n", PERCENT); }
"&&"            { printf("%d\n", LAND); }
"||"            { printf("%d\n", LOR); }
"!"         { printf("%d\n", LNOT); }
"<"         { printf("%d\n", LESSTHAN); }
">"         { printf("%d\n", GREATERTHAN); }
"<="            { printf("%d\n", LTEQUAL); }
">="            { printf("%d\n", GTEQUAL); }
"=="            { printf("%d\n", EQUAL); }
"!="            { printf("%d\n", NOTEQUAL); }
"&"         { printf("%d\n", BITAND); }
"|"         { printf("%d\n", BITOR); }
"^"         { printf("%d\n", BITXOR); }
"("         { printf("%d\n", LPARA); }
")"         { printf("%d\n", RPARA); }
"["         { printf("%d\n", LBRACKET); }
"]"         { printf("%d\n", RBRACKET); }
"{"         { printf("%d\n", LCURLY); }
"}"         { printf("%d\n", RCURLY); }
","         { printf("%d\n", COMMA); }
";"         { printf("%d\n", SEMICOLON); }
"="         { printf("%d\n", ASSIGN); }

    /* rules for keywords */ 

"char"          { printf("%d\n", CHAR); }
"int"           { printf("%d\n", INT); }
"void"          { printf("%d\n", VOID); }
"if"            { printf("%d\n", IF); }
"else"          { printf("%d\n", ELSE); }
"while"         { printf("%d\n", WHILE); }
"for"           { printf("%d\n", FOR); }
"continue"      { printf("%d\n", CONTINUE); }
"break"         { printf("%d\n", BREAK); }
"return"        { printf("%d\n", RETURN); }


	/* rule for identifier*/

{IDENTIFIER}        { printf("%d\t%s\n", IDENTIFIER, yytext); count++;}

{INTEGER}       { printf("%d\t%s\n", INTEGER, yytext); }
{STRING}        { printf("%d\t%s\n", STRING, yytext); }

    
{DELIMITER}+

   
 
%%

int main(int argc, char *argv[]) {
	yyin = fopen(argv[1], "r");
    yylex();
	fclose(yyin);
	printf("Total No of comment lines %d\n", cmnt_line);
	printf("Total No of identifiers %d\n", count);
    return 0;
}
