program eTasks;

{
 ########################################################################

       Projeto: eTasks
        Versão: 2.0.0
 Desenvolvedor: Rafael de Figueiredo Alves

 Cópia Autorizada© 2024 - Rafael de Figueiredo Alves / DevPegasus-br

 Descrição:
 Projeto de App mobile (Android) e desktop (Windows) para gerenciamento de tarefas,
 listas de mercado, metas, Anotações, controle financeiro e listas de leituras com foco na produtividade
 e no bom humor.

 Dedicatória:
 "Eu, Rafael de Figueiredo Alves, desenvolvedor deste software, dedico o resultado deste
  trabalho e fruto de tempo de dedicação e estudo aos grandes amores da minha vida:
  Minha esposa Jailza, meu filho Davi e minha filha Rafaela. A paciência deles comigo e
  o encorajamento que eles me deram e sempre dão foi o fator crucial para a concretização
  deste projeto. A eles, todo o meu amor e admiração."

 ########################################################################
}

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  eTranslate4Pascal,
  System.SysUtils,
  System.IOUtils,
  eTasks.View.Main in 'src\View\eTasks.View.Main.pas' {fMain},
  eTasks.Components.AppBar in 'src\Components\Bars\eTasks.Components.AppBar.pas' {AppBar},
  eTasks.Components.TitleBar in 'src\Components\Bars\eTasks.Components.TitleBar.pas' {TitleBar},
  eTasks.Components.ColorPallete in 'src\Components\eTasks.Components.ColorPallete.pas',
  eTasks.Components.Interfaces in 'src\Components\eTasks.Components.Interfaces.pas',
  eTasks.Shared.Utils in 'src\Shared\eTasks.Shared.Utils.pas',
  eTasks.Components.Builder in 'src\Components\eTasks.Components.Builder.pas',
  eTasks.Components.Offcanvas in 'src\Components\Offcanvas\eTasks.Components.Offcanvas.pas' {Offcanvas},
  eTasks.Shared.Consts in 'src\Shared\eTasks.Shared.Consts.pas' {$R *.res},
  eTasks.Components.AvatarMenu in 'src\Components\Offcanvas\eTasks.Components.AvatarMenu.pas' {AvatarMenu},
  eTasks.Components.Menu in 'src\Components\Offcanvas\eTasks.Components.Menu.pas' {OffcanvasMenu},
  eTasks.Components.ActionButton in 'src\Components\Buttons\eTasks.Components.ActionButton.pas' {ActionButton},
  eTasks.Components.NavBar in 'src\Components\Bars\eTasks.Components.NavBar.pas' {NavBar},
  eTasks.View.PageLayout in 'src\View\Layouts\eTasks.View.PageLayout.pas' {PageLayout},
  eTasks.View.Teste in 'src\View\Pages\eTasks.View.Teste.pas' {PageLayout1},
  eTasks.View.Interfaces in 'src\View\eTasks.View.Interfaces.pas',
  eTasks.View.NavigationManager in 'src\View\Services\eTasks.View.NavigationManager.pas',
  eTasks.View.Menu1 in 'src\View\eTasks.View.Menu1.pas' {Menu1},
  eTasks.Shared.Android.Utils in 'src\Shared\eTasks.Shared.Android.Utils.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  GlobalUseSkia := True;
  Application.Initialize;

  {$IFDEF ANDROID}
  eTranslate(TPath.Combine(TPath.GetDocumentsPath, 'translate.json'), 'pt-BR');
  {$ENDIF}

  {$IFDEF MSWINDOWS}
  eTranslate(ExtractFilePath(ParamStr(0)) + 'translate.json', 'pt-BR');
  {$ENDIF}

  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TMenu1, Menu1);
  Application.Run;
end.
