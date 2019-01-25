%{
	#include <stdio.h>
	#include <string.h>
	#include <math.h>
	#include "1407011.tab.h"
	extern int yylval;
	int yylineno = 0 ;
	
	int num_keyword=0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14;
	int num_arithmatic=0,b1,b2,b3,b4,b5;
	int num_unary=0,c1,c2,c3,c4;
	int num_relation=0,d1,d2,d3,d4,d5,d6;
	int num_logical=0,e1,e2,e3;
	int num_assignment=0,f1,f2,f3,f4,f5,f6;
	int num_predefinefunction=0,g1,g2;
	int num_puncuation=0,h1,h2,h3,h4;
	int num_branch=0,i1,i2,i3,i4,i5,i6;
	int num_headerfile=0;
	int num_int=0;
	int num_float=0;
	int num_identifier=0;
	
%}

single_line_comment [$].*
multiple_line_comment [ ]*[$][$][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[$][$]
digit	(-|\+)*[0-9]
number	{digit}*[.]?{digit}+
header	"import"[ ]*+[^\n]+[.h][ ]*

%%
[a-z]           			{yylval = *yytext - 'a'; ++num_identifier; return VARIABLE; }	
{digit}+	    			{yylval = atoi(yytext); ++num_int; return NUMBER; }
"perfect" 			        {a1 = 1;      return INT;		}
"fraction"  			    {a2 = 1;      return FLOAT;     }
"character"        			{a3 = 1;      return CHAR; 		}
"since"       			    {a4 = 1;      return FOR; 		}
"during"    			 	{a5= 1;       return WHILE; 	}
"when"      			    {a6 = 1;      return IF;		}
"or"        			    {a7 = 1;      return ELSE;		}
"back"      			    {a8 = 1;      return RETURN; 	}
"select"        			{a9 = 1;      return SWITCH;	}
"nothing"       			{a10 = 1;     return VOID; 		}
"leave"     			    {a11 = 1;     return BREAK;     }
"event"         			{a12 = 1;     return CASE;      }
"carryon"       			{a13 = 1;     return CONTINUE; 	}
"default"       			{a14 = 1;     return DEFAULT; 	}



"+" 						{b1 = 1;      return PLUS;		}
"-" 						{b2 = 1;      return MINUS;  	}
"*" 						{b3 = 1;      return MULTIPLY; 	}
"/"			    			{b4 = 1;      return DIVIDE;    }
"%"			    			{b5 = 1;      return MODULAR;	}


"^+" 						{c1 = 1;      return DPLUS; 	}	
"^-" 						{c2 = 1;      return DMINUS;	}
"@+" 						{c3 = 1;      return UPLUS; 	}
"@-" 						{c4 = 1;      return UMINUS; 	}


">"    						{d1 = 1;      return GREATERTHAN; 		}
"<"   						{d2 = 1;      return LESSTHAN; 			} 
">@"  						{d3 = 1;      return GREATERTHANEQUAL;	}
"<@"  						{d4 = 1;      return LESSTHANEQUAL;		}
"@@"          				{d5 = 1;      return EQUALEQUAL;	    }
"!@" 						{d6 = 1;      return NOTEQUAL; 			}


"/&" 						{e1 = 1;	  return AND;		}
"/|" 						{e2 = 1; 	  return OR;		}
"/!" 						{e3 = 1;	  return NOT; 		}
						

"@"  						{f1 = 1;      return EQUAL; 	 }
"+@" 						{f2 = 1;      return PLUSEQUAL;	 }
"-@" 						{f3 = 1;      return MINUSEQUAL; }
"*@" 						{f4 = 1;      return MULEQUAL;	 }
"/@" 						{f5 = 1;      return DIVEQUAL; 	 }
"%@" 						{f6 = 1;      return MODEQUAL; 	 }


"out" 					    {g1 = 1;	  return PRINT;		}
"in"  						{g2 = 1;	  return TAKE; 		}
						

"."  						{h1 = 1;      return DOT; 		}
","  						{h2 = 1;      return COMA;		}
"?"  						{h3 = 1;      return COLON;		}
"#"  						{h4 = 1;      return SEMI;		}


"("							{i1 = 1;	  return FBRS; 		}
")"							{i2 = 1;	  return FBRE;  	}
"{"							{i3 = 1;	  return SBRS; 		}
"}"							{i4 = 1;	  return SBRE; 		}
"["							{i5 = 1;	  return TBRS;		}
"]"							{i6 = 1;	  return TBRE; 		}

						
{header}  			{++num_headerfile; printf("Header file.\n"); }
"perfect main"	    {return MAIN; }

[ \t]		;
[ \n]   { yylineno = yylineno + 1;}	           ;
. {
	printf("Nothing matched  %s %d \n",yytext,yylineno+1);
	exit(0);
}
%%

int yywrap()
{
	return 1;
}

int main()
{
		yyin = freopen("1407011.c", "r",stdin);
		freopen("1407011.txt","w",stdout);
		yyparse();
		num_keyword = a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14;
		num_arithmatic = b1+b2+b3+b4+b5;
		num_unary = c1+c2+c3+c4;
		num_relation = d1+d2+d3+d4+d5+d6;
		num_logical = e1+e2+e3;
		num_assignment = f1+f2+f3+f4+f5+f6;
		num_predefinefunction = g1+g2;
		num_puncuation = h1+h2+h3+h4;
		num_branch = i1+i2+i3+i4+i5+i6;
		printf("\nTotal Number KeyWord:            %d\n",num_keyword);
		printf("Total Number Arithmatic Operation: %d\n",num_arithmatic);
		printf("Total Number Unary Operation:      %d\n",num_unary);
		printf("Total Number Relational Operation: %d\n",num_relation);
		printf("Total Number Logical Operation:    %d\n",num_logical);
		printf("Total Number Assignment Operation: %d\n",num_assignment);
		printf("Total Number Predefine Function:   %d\n",num_predefinefunction);
		printf("Total Number Puncuation:           %d\n",num_puncuation);
		printf("Total Number Branch:               %d\n",num_branch);
		printf("Total Number Header File:          %d\n",num_headerfile);
		printf("Total Number Integer Number:       %d\n",num_int);
		printf("Total Number Float Number:         %d\n",num_float);
		printf("Total Number Identifier:           %d\n",num_identifier);
		return 0;
}