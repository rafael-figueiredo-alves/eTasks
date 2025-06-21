program eTasks;

{
 ########################################################################

       Projeto: eTasks
        Versão: 2.0.0
 Desenvolvedor: Rafael de Figueiredo Alves

 Cópia Autorizada© 2025 - Rafael de Figueiredo Alves / DevPegasus-br

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
  LocalStorage4Pascal,
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
  eTasks.Shared.Consts in 'src\Shared\eTasks.Shared.Consts.pas',
  eTasks.Components.AvatarMenu in 'src\Components\Offcanvas\eTasks.Components.AvatarMenu.pas' {AvatarMenu},
  eTasks.Components.ActionButton in 'src\Components\Buttons\eTasks.Components.ActionButton.pas' {ActionButton},
  eTasks.Components.NavBar in 'src\Components\Bars\eTasks.Components.NavBar.pas' {NavBar},
  eTasks.View.PageLayout in 'src\View\Layouts\eTasks.View.PageLayout.pas' {PageLayout},
  eTasks.View.Teste in 'src\View\Pages\eTasks.View.Teste.pas' {PageLayout1},
  eTasks.View.NavigationManager in 'src\View\Services\eTasks.View.NavigationManager.pas',
  eTasks.View.Menu1 in 'src\View\eTasks.View.Menu1.pas' {Menu1},
  eTasks.Shared.Android.Utils in 'src\Shared\eTasks.Shared.Android.Utils.pas',
  eTasks.View.Enums in 'src\View\Utils\eTasks.View.Enums.pas',
  eTasks.View.Types in 'src\View\Utils\eTasks.View.Types.pas',
  eTasks.View.Layouts.Interfaces in 'src\View\Layouts\eTasks.View.Layouts.Interfaces.pas',
  eTasks.View.Services.Interfaces in 'src\View\Services\eTasks.View.Services.Interfaces.pas',
  eTasks.View.ThemeService in 'src\View\Services\eTasks.View.ThemeService.pas',
  eTasks.Components.MainMenu in 'src\Components\Offcanvas\eTasks.Components.MainMenu.pas' {MainMenu},
  eTasks.Components.LanguageMenu in 'src\Components\Offcanvas\eTasks.Components.LanguageMenu.pas' {LanguageMenu},
  eTasks.Components.FilterMenu in 'src\Components\Offcanvas\eTasks.Components.FilterMenu.pas' {FilterMenu},
  eTasks.Components.TranslationEnums in 'src\Components\Enums\eTasks.Components.TranslationEnums.pas',
  eTasks.Components.MenuEnums in 'src\Components\Enums\eTasks.Components.MenuEnums.pas',
  eTasks.View.LanguageService in 'src\View\Services\eTasks.View.LanguageService.pas',
  eTasks.Components.ToastMessage in 'src\Components\Toast\eTasks.Components.ToastMessage.pas' {ToastMessage},
  eTasks.Components.IToastService in 'src\Components\Services\Interfaces\eTasks.Components.IToastService.pas',
  eTasks.Components.ToastType in 'src\Components\Enums\eTasks.Components.ToastType.pas',
  eTasks.Components.ToastService in 'src\Components\Services\eTasks.Components.ToastService.pas',
  eTasks.Components.DialogOptions in 'src\Components\Dialog\eTasks.Components.DialogOptions.pas',
  eTasks.Components.DialogType in 'src\Components\Enums\eTasks.Components.DialogType.pas',
  eTasks.Components.IDialogService in 'src\Components\Services\Interfaces\eTasks.Components.IDialogService.pas',
  eTasks.Components.DialogService in 'src\Components\Services\eTasks.Components.DialogService.pas',
  eTasks.Components.ModalDialog in 'src\Components\Dialog\eTasks.Components.ModalDialog.pas' {ModalDialog},
  eTasks.Components.Accordion in 'src\Components\Containers\eTasks.Components.Accordion.pas' {Accordion: TFrame},
  eTasks.Shared.TranslateKeyConsts in 'src\Shared\eTasks.Shared.TranslateKeyConsts.pas',
  eTasks.Controller.Main in 'src\Controller\eTasks.Controller.Main.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;

  {$REGION 'Inicialização dos serviços'}
  TLocalstorage.InitLocalStorage4Pascal(LocalStorageFile);
  InitThemeService();
  InitLanguageService();
  InitToastService();
  InitDialogService();

  {$IFDEF ANDROID}
  eTranslate(TPath.Combine(TPath.GetDocumentsPath, TranslationFile), LanguageService.GetLanguage);
  {$ENDIF}

  {$IFDEF MSWINDOWS}
  eTranslate(ExtractFilePath(ParamStr(0)) + TranslationFile, LanguageService.GetLanguage);
  {$ENDIF}

  {$ENDREGION}

  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TModalDialog, ModalDialog);
  Application.Run;
end.
