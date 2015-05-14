head
  = tit:LITERAL COMMA fec:ANIO LBRACE crit:(critica)+ RBRACE  { return ('<b>'+tit+' ('+fec+')</b><table width 512px border 1>'+crit+'</table>'); }
  
critica
  = n:LITERAL LBRACKET a:(contenido) RBRACKET { return ('<tr><td>' + n + '</td>' + a +'</tr>'); }
  
contenido
  = texto:LITERAL COMMA nota:NOTA SEMICOLON { return ('<td>' +texto + '</td><td>' + nota+'</td>'); }

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