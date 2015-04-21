/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PLUS = 258,
    MINUS = 259,
    MULT = 260,
    DIV = 261,
    MOD = 262,
    LAND = 263,
    LOR = 264,
    LNOT = 265,
    LESSTHAN = 266,
    GREATERTHAN = 267,
    LTEQUAL = 268,
    GTEQUAL = 269,
    EQUAL = 270,
    NOTEQUAL = 271,
    BITAND = 272,
    BITOR = 273,
    BITXOR = 274,
    LPARA = 275,
    RPARA = 276,
    LBRACKET = 277,
    RBRACKET = 278,
    LCURLY = 279,
    RCURLY = 280,
    COMMA = 281,
    SEMICOLON = 282,
    ASSIGN = 283,
    CHAR = 284,
    INT = 285,
    VOID = 286,
    IF = 287,
    ELSE = 288,
    WHILE = 289,
    FOR = 290,
    CONTINUE = 291,
    BREAK = 292,
    RETURN = 293,
    ID = 294,
    INTEGER = 295,
    STRING = 296
  };
#endif
/* Tokens.  */
#define PLUS 258
#define MINUS 259
#define MULT 260
#define DIV 261
#define MOD 262
#define LAND 263
#define LOR 264
#define LNOT 265
#define LESSTHAN 266
#define GREATERTHAN 267
#define LTEQUAL 268
#define GTEQUAL 269
#define EQUAL 270
#define NOTEQUAL 271
#define BITAND 272
#define BITOR 273
#define BITXOR 274
#define LPARA 275
#define RPARA 276
#define LBRACKET 277
#define RBRACKET 278
#define LCURLY 279
#define RCURLY 280
#define COMMA 281
#define SEMICOLON 282
#define ASSIGN 283
#define CHAR 284
#define INT 285
#define VOID 286
#define IF 287
#define ELSE 288
#define WHILE 289
#define FOR 290
#define CONTINUE 291
#define BREAK 292
#define RETURN 293
#define ID 294
#define INTEGER 295
#define STRING 296

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
