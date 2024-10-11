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
  eTasks.View.Main in 'src\View\eTasks.View.Main.pas' {fMain},
  eTasks.Components.AppBar in 'src\Components\Bars\eTasks.Components.AppBar.pas' {AppBar},
  eTasks.Components.TitleBar in 'src\Components\Bars\eTasks.Components.TitleBar.pas' {TitleBar},
  eTasks.Components.ColorPallete in 'src\Components\eTasks.Components.ColorPallete.pas',
  eTasks.Components.Interfaces in 'src\Components\eTasks.Components.Interfaces.pas',
  eTasks.Shared.Utils in 'src\Shared\eTasks.Shared.Utils.pas',
  eTasks.Components.Builder in 'src\Components\eTasks.Components.Builder.pas',
  eTasks.Components.Offcanvas in 'src\Components\Offcanvas\eTasks.Components.Offcanvas.pas' {Offcanvas};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TAppBar, AppBar);
  Application.CreateForm(TTitleBar, TitleBar);
  Application.CreateForm(TOffcanvas, Offcanvas);
  Application.Run;
end.
