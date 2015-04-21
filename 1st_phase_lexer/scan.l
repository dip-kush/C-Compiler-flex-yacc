%option noyywrap

%{
#include<stdio.h>
#include<string.h>
#include "y.tab.h"

typedef union{
char *string;
int integer;
}yylType;

extern int yylval_int;
extern char yylval_str;
int count=0,cmnt_line=0,line_count,char_count;
/*extern yylType yylval; */
%}

%x CMNT
UCN       (\\u[0-9a-fA-F]{4}|\\U[0-9a-fA-F]{8})
DIGIT     [0-9]
LETTER    [A-Za-z]
DELIMITER [ \t]
ID {LETTER}({LETTER}|{DIGIT}|_)*
INTEGER 0|([1-9][0-9]*)
FLOATING {INTEGER}*{.?}{INTEGER}+
STRING    L?\"([^"\\]|\\['"?\\abfnrtv]|\\[0-7]{1,3}|\\[Xx][0-9a-fA-F]+|{UCN})*\"
UNSTRING	\"[^\n\"]*\n
%%
    /* match identifier */
    /*^(.*)\n line_count++;*/

\n {line_count++;}
"/*" {BEGIN CMNT;}
<CMNT>. {;}
<CMNT>\n {cmnt_line++;}
<CMNT>[/][*]([^*]|[*]*[^*/])*[*]+[/] {cmnt_line++;}
<CMNT>"*/" {BEGIN INITIAL; cmnt_line++;}
<CMNT><<EOF>> {
	printf("Unterminated comment at line %d\n", line_count);
	return 0;	
}
	/* rules for operator and punctuations */
"+"         { return PLUS; }
"-"             { return MINUS; }
"*"         { return MULT; }
"/"         { return DIV; }
"%"         { return MOD; }
"&&"        { return LAND; }
"||"        { return LOR; }
"!"         { return LNOT; }
"<"         { return LESSTHAN; }
">"         { return GREATERTHAN; }
"<="        { return LTEQUAL; }
">="        { return GTEQUAL; }
"=="        { return EQUAL; }
"!="        { return NOTEQUAL; }
"&"         { return BITAND; }
"|"         { return BITOR; }
"^"         { return BITXOR; }
"("         { return LPARA; }
")"         { return RPARA; }
"["         { return LBRACKET; }
"]"         { return RBRACKET; }
"{"         { return LCURLY; }
"}"         { return RCURLY; }
","         { return  COMMA; }
";"         { return SEMICOLON; }
"="         { return  ASSIGN; }

    /* rules for keywords */ 

"char"          { return CHAR; }
"int"           { return INT; }
"void"          { return VOID; }
"if"            { return  IF; }
"else"          { return ELSE; }
"while"         { return  WHILE; }
"for"           { return FOR; }
"continue"      { return  CONTINUE; }
"break"         { return BREAK; }
"return"        { return RETURN; }


	/* rule for identifier*/

{ID}        { /*yylval.string=(char *)malloc(sizeof(char)*(yyleng+1));
					  strncpy(yylval.string, yytext, yyleng);	
					  count++;*/
					 return ID;}

{INTEGER}       { /*yylval.integer=atoi(yytext);*/ return INTEGER; }
{STRING}        { /*yylval.string=(char *)malloc(sizeof(char)*(yyleng+1));
					  strncpy(yylval.string, yytext, yyleng);	*/
					 return ID;	}

    
{DELIMITER}+ 

  /* handling errors */

{INTEGER}+{ID}+ { printf("Invalid Identifier %s at line %d\n",yytext, line_count);}

{UNSTRING} printf("Invalid String\n at %d\n", line_count);

 
%%

/*

int main(int argc, char *argv[]) {
	int s;
	yyin = fopen(argv[1], "r");
    while(s=yylex()){
		switch(s){
			case PLUS:
				printf("<+>\n");
				break;
			case MINUS:
				printf("<->\n");
				break;
			case MULT:
				printf("<->\n");
				break;
			case DIV:
				printf("</>\n");
				break;
			case MOD:
				printf("<%>\n");
				break;	
			case LAND:
				printf("<&&>\n");
				break;
			case LOR:
				printf("<||>\n");
				break;	
			case LNOT:
				printf("<!>\n");
				break;	
			case LESSTHAN:
				printf("<<>\n");
				break;
			case GREATERTHAN:
				printf("<>>\n");
				break;
			case LTEQUAL:
			    printf("<<=>\n");
				break;
			case GTEQUAL:
				printf("<>=>\n");
				break;
			case EQUAL:
				printf("<==>\n");
				break;
			case NOTEQUAL:
				printf("<!=>\n");
				break;
			case BITAND:
				printf("<&>\n");
				break;
			case BITOR:
				printf("<|>\n");
				break;
			case BITXOR:
				printf("<^>\n");
				break;
			case LPARA:
				printf("<(>\n");
				break;
			case RPARA:
				printf("<)>\n");
				break;
			case LBRACKET:
				printf("<[>\n");
				break;
			case RBRACKET:
				printf("<]>\n" );
				break;
			case LCURLY:
				printf("<{>\n");
				break;
			case RCURLY:
				printf("<}>\n");
				break;
			case COMMA:
				printf("<,>\n");
				break;
			case SEMICOLON:
				printf("<;>\n");
				break;
			case ASSIGN:
				printf("<=>\n");
				break;
			case CHAR:
				printf("<char>\n");
				break;
			case INT:
				printf("<int>\n");
				break;
			case VOID:
				printf("<void>\n");
				break;
			case IF:
				printf("<if>\n");
				break;
			case ELSE:
				printf("<else>\n");
				break;
			case WHILE:
				printf("<while>\n");
				break;
			case FOR:	
				printf("<for>\n");
				break;
			case CONTINUE:
				printf("<continue>\n");
				break;
			case BREAK:
				printf("<break>\n");
				break;
			case RETURN:
				printf("<return>\n");
				break;
			case ID:{
				printf("<id, %s>\n", yylval.string);
				free(yylval.string);
				break;
			}
			case INTEGER:
				printf("<num, %d>\n",yylval.integer);
				break;
			case STRING:{
				printf("<string, %s>\n",yylval.string);
				free(yylval.string);
				break;
			}			
		
		}
	}
	fclose(yyin);
	printf("Total No of comment lines %d\n", cmnt_line);
	printf("Total No of identifiers %d\n", count);
	printf("Toal lines of count %d\n",line_count);
    return 0;
	
}

*/
