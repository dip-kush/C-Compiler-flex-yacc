%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    extern FILE *yyin;
%}

%token PLUS MINUS MULT DIV MOD LAND LOR LNOT LESSTHAN GREATERTHAN LTEQUAL GTEQUAL EQUAL NOTEQUAL BITAND BITOR BITXOR LPARA RPARA LBRACKET RBRACKET LCURLY RCURLY COMMA SEMICOLON ASSIGN CHAR INT VOID IF ELSE WHILE FOR CONTINUE BREAK RETURN ID INTEGER STRING


%left PLUS MINUS
%left MULT DIV 

%%
Program: MainProgram
        | Program Function
        ;

MainProgram : INT ID LPARA RPARA LCURLY Statements RCURLY
            ;

Function : Type ID LPARA Parameters RPARA LCURLY Statements RCURLY 
          ;

Parameters : Parameter
           | Parameters COMMA Parameter

Parameter : Type ID
           ;

Statements : DeclareStatements ExpStatements
           | DeclareStatements
           | ExpStatements
           ;
 
DeclareStatements : DeclareStatements DeclareStatement
                  | DeclareStatement
                  ;

DeclareStatement : Type IDList SEMICOLON
                 ;

Type : INT
     ;

ArgumentList : Exp
             | ArgumentList COMMA Exp
             ;

IDList : ID
       | IDList COMMA ID
       ;

ExpStatements : ExpStatements ExpStatement
              | ExpStatement
              ;

ExpStatement : Exp SEMICOLON
             | ID ASSIGN Exp SEMICOLON
             ;

Exp : Exp PLUS Term
    | Exp MINUS Term   
    | Exp LTEQUAL Term
    | Exp GREATERTHAN Term
    | Exp LESSTHAN Term
    | Exp LAND Term
    | Exp LOR Term 
    | Exp LNOT Term
    | Term
    ;

Term : Term MULT Term
     | Term DIV Term
     | Term MOD Term
     | ID
     | Number   
     ;

Number : INTEGER
       ;

%%



int yyerror(char *msg){
    printf("%s\n", msg);
    exit(0);
}    

int main(int argc, char *argv[]){
    yyparse();
    return 0;
}

  





