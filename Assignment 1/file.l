%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

int keyword=0, identifier=0, arithmaticnum=0, unary=0, logical=0, relational=0, assignment=0, punctuation=0, headerfile=0, libraryfunction=0, function=0, loop=0, switchcase=0, cndstatement=0, integer=0, floatnum=0, stringnum=0, scmnt=0, mcmnt=0;

%}

keyword perfect|fraction|character|long|short|signed|unsigned|sentence|circle|back|start|end|leave|since|during|action|nothing|event|default|select

identifiers _[a-zA-Z]([a-zA-Z0-9])*

arithmaticop "++"|"--"|"**"|"//"|"^^"

unaryop [@][+]|[@][-]|[+]|[-]

logicalop [&][&]|[|][|]|[!]

relationalop [<]|[>]|[<][@]|[>][@]|[@][@]|[!][@]

assignmentop [@]|[+][@]|[-][@]|[*][+]|[/][+]

punctuation "#"|"{"|"}"|"("|")"|"["|"]"|"$"|"$$"|","|"%"|">"|"<"|"$"|"?"

header_file "insert{"+[a-zA-Z]

library_function "in>"|"out<"

user_function "action"+" "

loop "circle"+" "

switch "select"+" "

conditional_statement "when"+" "|"or"+" "|"otherwise"+" "

integer (-|\+)?[0-9]+

float [+-]?[0-9]+[.][0-9]+|[+-]?[.][0-9]+|[1-9]+e[+-][0-9]+

string \"(\\.|[^"])*\"

single_line_comment [$].*

multiple_line_comment [ ]*[$][$][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[$][$]


%%

{keyword} {keyword++;}

{identifiers} {identifier++;}

{arithmaticop} {arithmaticnum++;}

{unaryop} {unary++;}

{logicalop} {logical++;}

{relationalop} {relational++;}

{assignmentop} {assignment++;}

{punctuation} {punctuation++;}

{header_file} {headerfile++;}

{library_function} {libraryfunction++;}

{user_function} {function++;}

{loop} {loop++;}

{switch} {switchcase++;}

{conditional_statement} {cndstatement++;}

{integer} {integer++;}

{float} {floatnum++;}

{string} {stringnum++;}

{single_line_comment} {scmnt++;}

{multiple_line_comment} {mcmnt++;}

.

%%

int yywrap(){

return 1;

}

int main()
{
    yyin=freopen("file.c","r",stdin);
    yyout=freopen("fout.txt","w",stdout);
    yylex();
	
    printf("No. of keywords: %d",keyword);
	printf("\nNo. of identifiers: %d",identifier);
	printf("\nNo. of arithmatic operation: %d",arithmaticnum);
    printf("\nNo. of unary operation: %d",unary);
	printf("\nNo. of logical operation: %d",logical);
	printf("\nNo. of relational operation: %d",relational);
	printf("\nNo. of assignment operation: %d",assignment);
	printf("\nNo. of punctuations: %d",punctuation);
	printf("\nNo. of header files: %d",headerfile);
	printf("\nNo. of library functions: %d",libraryfunction);
	printf("\nNo. of user defined functions: %d",function);
	printf("\nNo. of loops: %d",loop);
	printf("\nNo. of switch cases: %d",switchcase);
	printf("\nNo. of conditional statements: %d",cndstatement);
	printf("\nNo. of integer numbers: %d",integer);
	printf("\nNo. of float numbers: %d",floatnum);
	printf("\nNo. of strings: %d",stringnum);
	printf("\nNo. of single line comments: %d",scmnt);
    printf("\nNo. of multiple line comments: %d",mcmnt);
    
    fclose(yyin);
    fclose(yyout);
    return 0;

}