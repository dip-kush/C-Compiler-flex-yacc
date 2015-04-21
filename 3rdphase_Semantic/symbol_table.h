#define t_void	1
#define t_char	2
#define t_int	3
#define t_float	4
struct symrec
{
	char *name;
	int type;
	struct symrec *next;
};
typedef struct symrec symrec;
symrec *sym_table = (symrec *)0;
symrec *putsym();
symrec *getsym();
symrec *putsym(char *sym_name,int sym_type)
{
	symrec *ptr;
	ptr=(symrec *)malloc(sizeof(symrec));
	ptr->name=(char *)malloc(strlen(sym_name)+1);
	strcpy(ptr->name,sym_name);
	ptr->type=sym_type;
	ptr->next=(struct symrec *)sym_table;
	sym_table=ptr;
	return ptr;
}
symrec *getsym(char *sym_name)
{
	symrec *ptr;
	for(ptr=sym_table;ptr!=(symrec *)0;ptr=(symrec *)ptr->next)
	if(strcmp(ptr->name,sym_name)==0)
	return ptr;
	return 0;
}
