grammar Expresiones; // Nombre de la gramática

prog:   stat+ ;  // Un programa es una o más instrucciones

stat:   expr NEWLINE                # printExpr   // Imprimir expresión
    |   ID '=' expr NEWLINE         # assign     // Asignación de variable
    |   NEWLINE                     # blank      // Línea en blanco
    ;

expr:   expr op=('*'|'/') expr      # MulDiv    // Multiplicación o división
    |   expr op=('+'|'-') expr      # AddSub    // Suma o resta
    |   INT                         # int       // Número entero
    |   ID                          # id        // Variable
    |   '(' expr ')'                # parens    // Expresión entre paréntesis
    ;

MUL :   '*' ; // Token para multiplicación
DIV :   '/' ; // Token para división
ADD :   '+' ; // Token para suma
SUB :   '-' ; // Token para resta
ID  :   [a-zA-Z]+ ;      // Identificadores (variables)
INT :   [0-9]+ ;         // Números enteros
NEWLINE:'\r'? '\n' ;     // Nueva línea (final de instrucción)
WS  :   [ \t]+ -> skip ; // Espacios y tabulaciones (se ignoran)
