head
  = tit:TEXTO COMMA anio:ANIO LBRACE crit:(critica)+ RBRACE  { return {Titulo:tit, Año:anio, Criticas:crit }; }
  
critica
  = titcrit:TEXTO LBRACKET conte:(contenido) RBRACKET { return {"Titulo Critica":titcrit, Contenido:conte }; }
  
contenido
  = texto:TEXTO COMMA nota:NOTA SEMICOLON { return {Texto:texto, Calificacion:nota }; }

_ = $[ \t\n\r]*

TEXTO = _ "\'" texto:$([^']*) "\'" _ { return texto; }
ANIO = _ date:$([1-2][0-9][0-9][0-9]) _ { return date; }
NOTA = _ nota:$([0-5]) _ { return nota+"/5"; }

COMMA = _ "," _
SEMICOLON = _ ";" _
LBRACE = _ "{" _
RBRACE = _ "}" _
LBRACKET = _ "[" _
RBRACKET = _ "]" _