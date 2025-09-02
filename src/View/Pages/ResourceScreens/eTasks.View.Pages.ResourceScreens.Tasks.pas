unit eTasks.View.Pages.ResourceScreens.Tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels, FMX.Objects;

type
  TResourceTasks = class(TResourceBase)
    LayCentro: TLayout;
    LayTexto: TLayout;
    imgTarefas: TImage;
    lblTexto: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceTasks;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    procedure TranslateUI; reintroduce;
  end;

var
  ResourceTasks: TResourceTasks;

implementation

uses
  eTasks.Components.ColorPallete,
  eTasks.View.ThemeService,
  eTranslate4Pascal,
  eTasks.Shared.TranslateKeyConsts,
  eTasks.View.LanguageService;

{$R *.fmx}

{ TResourceTasks }

function TResourceTasks.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := self;
  self.lblTexto.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceTasks.New(const Value: TLayout): TResourceTasks;
begin
  Result := TResourceTasks.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
  Result.TranslateUI;
  languageService.SubscribeMethod('ResourceTasks',Result.TranslateUI);
end;

procedure TResourceTasks.TranslateUI;
begin
  inherited;
  lblTexto.Text := eTranslate.Translate(ResourcePages_Tasks_ResourcePage, 'Gerencie as tarefas do seu dia em poucos cliques. Inicie adicionando uma tarefa tocando no Mais no canto inferior direito.');
end;

end.
