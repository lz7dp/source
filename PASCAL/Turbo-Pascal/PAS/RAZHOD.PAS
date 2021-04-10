program RazhodGorivo;
{из╖и▒л┐ва ░аз╡ода на го░иво за 100 км.}
   var kilometri,litri,razhod:real;
   BEGIN
     writeln('Тази п░ог░ама из╖и▒л┐ва ░аз╡ода на го░иво');
     writeln('за Ва╕и┐ ав▓омобил');
     writeln('Колко киломе▓░а п░опа▓│ва╡▓е о▓ п░еди╕но▓о');
     writeln('п║лно за░еждане до по▒ледно▓о п║лно за░еждане');
     readln(kilometri);
     writeln('Колко ли▓░а нал┐╡▓е по▒ледни┐ п║▓, за да нап║лни▓е');
     writeln('дого░е ░езе░воа░а?');
     readln(litri);
     razhod:=litri*100/kilometri;
      if razhod>5 then
           writeln('Вие има▓е н│жда о▓ по-икономи╖на кола');
      writeln('Ва╕а▓а кола има ░аз╡од',razhod:2:3,'ли▓░а на 100 км.');
   END.