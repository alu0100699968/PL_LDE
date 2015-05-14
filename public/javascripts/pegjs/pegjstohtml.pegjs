head
  = tit:LITERAL COMMA fec:ANIO LBRACE crit:(critica)+ RBRACE  { return ('&lt;b&gt;'+tit+' ('+fec+')&lt;/b&gt;\n&lt;table border 1&gt;'+crit+'\n&lt;/table&gt;'); }
  
critica
  = n:LITERAL LBRACKET a:(contenido) RBRACKET { return ('\n\t&lt;tr&gt;\n\t\t&lt;td&gt;' + n + '&lt;/td&gt;' + a +'\n\t&lt;/tr&gt;'); }
  
contenido
  = texto:LITERAL COMMA nota:NOTA SEMICOLON { return ('&lt;td&gt;' +texto + '&lt;/td&gt;\n\t\t&lt;td&gt;' + nota+'&lt;/td&gt;'); }

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