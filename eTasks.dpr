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
  eTasks.Components.TitleBar in 'src\Components\Bars\eTasks.Components.TitleBar.pas' {TitleBar};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TAppBar, AppBar);
  Application.CreateForm(TTitleBar, TitleBar);
  Application.Run;
end.
