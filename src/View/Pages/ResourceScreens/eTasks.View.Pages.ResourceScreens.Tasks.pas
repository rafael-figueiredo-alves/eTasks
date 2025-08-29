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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceTasks;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    function TranslateUI : iResource; reintroduce;
    procedure fTranslateUI;
  end;

var
  ResourceTasks: TResourceTasks;

implementation

uses
  eTasks.Components.ColorPallete,
  eTasks.View.ThemeService,
  eTranslate4Pascal,
  eTasks.Shared.TranslateKeyConsts, eTasks.View.LanguageService;

{$R *.fmx}

{ TResourceTasks }

procedure TResourceTasks.FormCreate(Sender: TObject);
begin
  inherited;
  self.fTranslateUI;
  languageService.SubscribeMethod('ResourceTasks', TResourceTasks(self).fTranslateUI)
end;

procedure TResourceTasks.fTranslateUI;
begin
  lblTexto.Text := eTranslate.Translate(ActionButton_Hint, 'Teste');
end;

function TResourceTasks.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := self;
end;

class function TResourceTasks.New(const Value: TLayout): TResourceTasks;
begin
  Result := TResourceTasks.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TResourceTasks.TranslateUI: iResource;
begin
  inherited;
  lblTexto.Text := eTranslate.Translate(ActionButton_Hint, 'Teste');
end;

end.
