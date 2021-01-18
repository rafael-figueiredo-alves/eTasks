unit eTasks.libraries.Windows;

interface

Type

 tLibraryWindows = Class
   Class Procedure EnviarEmail(destinatario, assunto, texto : string);
   Class Procedure AbrirLink(Link : string);
 End;

implementation

{ tLibraryWindows }

Uses
  winapi.shellapi, Winapi.Windows;

class procedure tLibraryWindows.AbrirLink(Link: string);
begin
 ShellExecute(GetDesktopWindow,
               'open',
               PChar(link),
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

class procedure tLibraryWindows.EnviarEmail(destinatario, assunto,
  texto: string);
var
  StringShellExecute: String;
begin
  StringShellExecute := StringShellExecute +

   'mailto:' +

   destinatario +

   '?subject=' + assunto +

   '&amp;body=' + texto;

  ShellExecute(GetDesktopWindow, 'open', PChar(StringShellExecute), '', '',
     SW_SHOWNORMAL);
end;

end.
