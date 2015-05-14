{
  var sum = 0
  var cont = 0
}

pelicula
  = tit:TEXTO COMMA anio:ANIO LBRACE crit:(critica)+ RBRACE  { return ('<b>' + tit + ' (' + anio + ') - Nota: ' + sum/cont + '</b><table width 512px border 1>' + crit + '</table>'); }
  
critica
  = titcrit:TEXTO LBRACKET conte:(contenido) RBRACKET { return ('<tr><td>' + titcrit + '</td>' + conte +'</tr>'); }
  
contenido
  = texto:TEXTO COMMA nota:NOTA SEMICOLON { return ('<td>' + texto + '</td><td>' + nota + '</td>'); }

_ = $[ \t\n\r]*

TEXTO = _ "\'" texto:$([^']*) "\'" _ { return texto; }
ANIO = _ date:$([1-2][0-9][0-9][0-9]) _ { return date; }
NOTA = _ nota:$([0-5]) _ { cont++; sum = sum + parseInt(nota); return nota+"/5"; }

COMMA = _ "," _
SEMICOLON = _ ";" _
LBRACE = _ "{" _
RBRACE = _ "}" _
LBRACKET = _ "[" _
RBRACKET = _ "]" _