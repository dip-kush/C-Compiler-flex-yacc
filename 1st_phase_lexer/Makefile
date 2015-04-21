CC=cc
LEX=lex
YACC=yacc 

CFLAGS=-w

YFLAGS=-d

scan: lex.yy.c y.tab.c
	$(CC) lex.yy.c y.tab.c $(CFLAGS) -o scan

y.tab.c: parse.y
	$(YACC) $(YFLAGS) parse.y

lex.yy.c: scan.l
	$(LEX) scan.l



clean: rm -rf lex.yy.c scan

 


