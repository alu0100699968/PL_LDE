head
  = tit:LITERAL COMMA fec:ANIO LBRACE crit:(critica)+ RBRACE  { return {Titulo:tit, Año:fec, Criticas:crit }; }
  
critica
  = n:LITERAL LBRACKET a:(contenido) RBRACKET { return {"Titulo Critica":n, Contenido:a }; }
  
contenido
  = texto:LITERAL COMMA nota:NOTA SEMICOLON { return {Texto:texto, Calificacion:nota }; }

_ = $[ \t\n\r]*

LITERAL = _ "\'" literal:$([^']*) "\'" _ { return literal; }
ANIO = _ date:$([1-2][0-9][0-9][0-9]) _ { return date; }
NOTA = _ nota:$([0-5]) _ { return nota+"/5"; }

COMMA = _ "," _
SEMICOLON = _ ";" _
LBRACE = _ "{" _
RBRACE = _ "}" _
LBRACKET = _ "[" _
RBRACKET = _ "]" _