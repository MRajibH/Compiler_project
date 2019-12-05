grammar compiler;
root: header_file mainfunction;
header_file: '$' text;
text: 'Start';

mainfunction: 'mainfunction:' content;
content: '['inside_main']';

inside_main: (statement)+;
statement: expression 
	   |ID '=' expression 
	   |ID '++'
	   |ID '--'	
	   |if_condition
	   |loop
	   ;
expression: expression('*'|'/') expression
		| expression ('+'|'-') expression
	    |INT
	    |ID
	    | '(' expression ')'
	    ;
condition: ID relational_op expression;
if_condition: 'jodi' '('condition')' '[' (statement)* ']';
loop: 'loop' '('condition')' '[' (statement)* | 'break' ']';

relational_op:'>'|'<'|'>='|'=='|'<='|'!=';
INT:[0-9]+;
WS : [ \r\n\t]+ -> skip ;
ID:[a-z|A-Z]+;
