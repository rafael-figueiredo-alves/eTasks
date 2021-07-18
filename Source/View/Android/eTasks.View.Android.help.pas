unit eTasks.View.Android.help;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Ani, FMX.TabControl;

type
  TForm_Android_Ajuda = class(TForm)
    Lay_main: TLayout;
    StyleBook1: TStyleBook;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    title_Ajuda: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    TabPrincipal: TTabControl;
    TabHome: TTabItem;
    TabTarefas: TTabItem;
    TabMetas: TTabItem;
    TabCategorias: TTabItem;
    TabListas: TTabItem;
    TabContas: TTabItem;
    TabAtualizacao: TTabItem;
    Btn_Avancar_Pagina: TImage;
    Btn_Home: TImage;
    Btn_Voltar_pagina: TImage;
    TabNovidades: TTabItem;
    TabPerguntas: TTabItem;
    Lay_banner_inferior: TLayout;
    Banner_ajuda: TImage;
    Lay_pergunta_top: TLayout;
    Img_pergunta_menu: TImage;
    Lay_Novidades_btn: TLayout;
    Lay_Tarefas_btn: TLayout;
    Lay_Categorias_btn: TLayout;
    Lay_Objetivos_btn: TLayout;
    Lay_compras_btn: TLayout;
    Lay_usuarios_btn: TLayout;
    Lay_atualiazacoes_btn: TLayout;
    Lay_perguntas_btn: TLayout;
    Image_novidades: TImage;
    Image_tarefas: TImage;
    Image_categorias: TImage;
    Image_Objetivos: TImage;
    Image_compras: TImage;
    Image_usuario: TImage;
    Image_updates: TImage;
    Image_perguntas: TImage;
    AnimaVoltaPagina: TFloatAnimation;
    AnimaHome: TFloatAnimation;
    AnimaAvancaPagina: TFloatAnimation;
    NavTarefas: TTabControl;
    NavTarefasHome: TTabItem;
    Layout1: TLayout;
    Image1: TImage;
    NavTarefasNova: TTabItem;
    LayBanner_novidades: TLayout;
    Banner_novidades: TImage;
    Lay_Novidades_texto: TLayout;
    Image_novidades_texto: TImage;
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabPrincipalChange(Sender: TObject);
    procedure Lay_Novidades_btnClick(Sender: TObject);
    procedure Lay_Tarefas_btnClick(Sender: TObject);
    procedure Lay_Categorias_btnClick(Sender: TObject);
    procedure Lay_Objetivos_btnClick(Sender: TObject);
    procedure Lay_compras_btnClick(Sender: TObject);
    procedure Lay_usuarios_btnClick(Sender: TObject);
    procedure Lay_atualiazacoes_btnClick(Sender: TObject);
    procedure Lay_perguntas_btnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Android_Ajuda: TForm_Android_Ajuda;

implementation

uses
  FMX.Platform,
  FMX.VirtualKeyBoard;

{$R *.fmx}

procedure TForm_Android_Ajuda.AnimaStatusFinish(Sender: TObject);
begin
  if AnimaStatus.Inverse = False then
  begin
    AnimaStatus.Inverse := true;
  end
  else
  begin
    AnimaStatus.Inverse := False;
    ModalResult := mrOk;
  end;
end;

procedure TForm_Android_Ajuda.Botao_voltarClick(Sender: TObject);
begin
  if TabPrincipal.ActiveTab = TabHome then
   AnimaStatus.Start
  else
   TabPrincipal.GotoVisibleTab(TabHome.Index);
end;

procedure TForm_Android_Ajuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  Form_Android_Ajuda := nil;
end;

procedure TForm_Android_Ajuda.FormCreate(Sender: TObject);
begin
  Btn_Voltar_pagina.Visible := false;
  Btn_Avancar_Pagina.Visible := False;
  Btn_Home.Visible := false;
end;

procedure TForm_Android_Ajuda.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
Var
  FService: iFMXVirtualKeyboardService;
begin
  if (Key = vkHardwareBack) then
  begin
    TPlatformServices.Current.SupportsPlatformService
      (iFMXVirtualKeyboardService, IInterface(FService));
    if (FService <> Nil) and (TVirtualKeyboardState.Visible
      in FService.VirtualKeyboardState) then
    begin
      // Botão BACK pressionado e teclado vísivel, apenas fecha o teclado
    end
    else
     begin
       Key := 0;
       Botao_voltarClick(sender);
     end;
  end;
end;

procedure TForm_Android_Ajuda.FormShow(Sender: TObject);
begin
  AnimaStatus.Start;
  Btn_Voltar_pagina.Visible := false;
  Btn_Avancar_Pagina.Visible := False;
  Btn_Home.Visible := false;
end;

procedure TForm_Android_Ajuda.Lay_atualiazacoes_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabAtualizacao.Index);
end;

procedure TForm_Android_Ajuda.Lay_Categorias_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabCategorias.Index);
end;

procedure TForm_Android_Ajuda.Lay_compras_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabListas.Index);
end;

procedure TForm_Android_Ajuda.Lay_Novidades_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabNovidades.Index);
end;

procedure TForm_Android_Ajuda.Lay_Objetivos_btnClick(Sender: TObject);
begin
 TabPrincipal.GotoVisibleTab(TabMetas.Index);
end;

procedure TForm_Android_Ajuda.Lay_perguntas_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabPerguntas.Index);
end;

procedure TForm_Android_Ajuda.Lay_Tarefas_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabTarefas.Index);
end;

procedure TForm_Android_Ajuda.Lay_usuarios_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabContas.Index);
end;

procedure TForm_Android_Ajuda.TabPrincipalChange(Sender: TObject);
begin
 case TabPrincipal.TabIndex of
  0: begin
      Btn_Voltar_pagina.Visible := false;
      Btn_Home.Visible := false;
      Btn_Avancar_Pagina.Visible := False;
     end;
 else
  begin
   Btn_Avancar_Pagina.Visible := True;
   Btn_Home.Visible := True;
   Btn_Voltar_pagina.Enabled := false;
   Btn_Voltar_pagina.Visible := True;
  end;
  end;
end;

end.

