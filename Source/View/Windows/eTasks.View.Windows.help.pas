unit eTasks.View.Windows.help;

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
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Effects,
  FMX.TabControl, FMX.Ani;

type
  TForm_Windows_Ajuda = class(TForm)
    Lay_main: TLayout;
    StyleBook1: TStyleBook;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    title_Ajuda: TImage;
    TabPrincipal: TTabControl;
    TabHome: TTabItem;
    Lay_banner_inferior: TLayout;
    Banner_ajuda: TImage;
    Lay_pergunta_top: TLayout;
    Img_pergunta_menu: TImage;
    Lay_Novidades_btn: TLayout;
    Image_novidades: TImage;
    Lay_Tarefas_btn: TLayout;
    Image_tarefas: TImage;
    Lay_Categorias_btn: TLayout;
    Image_categorias: TImage;
    Lay_Objetivos_btn: TLayout;
    Image_Objetivos: TImage;
    Lay_compras_btn: TLayout;
    Image_compras: TImage;
    Lay_usuarios_btn: TLayout;
    Image_usuario: TImage;
    Lay_atualiazacoes_btn: TLayout;
    Image_updates: TImage;
    Lay_perguntas_btn: TLayout;
    Image_perguntas: TImage;
    TabNovidades: TTabItem;
    TabTarefas: TTabItem;
    TabCategorias: TTabItem;
    TabMetas: TTabItem;
    TabListas: TTabItem;
    TabContas: TTabItem;
    TabAtualizacao: TTabItem;
    TabPerguntas: TTabItem;
    Btn_Avancar_Pagina: TImage;
    Btn_Home: TImage;
    Btn_Voltar_pagina: TImage;
    AnimaBtnVolta: TFloatAnimation;
    AnimaHome: TFloatAnimation;
    AnimaAvancaBtn: TFloatAnimation;
    LayBanner_novidades: TLayout;
    Banner_novidades: TImage;
    NavTarefas: TTabControl;
    NavTarefasHome: TTabItem;
    NavTarefasNova: TTabItem;
    Layout1: TLayout;
    Image1: TImage;
    Lay_Novidades_texto: TLayout;
    Image_novidades_texto: TImage;
    procedure Btn_voltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Lay_Novidades_btnClick(Sender: TObject);
    procedure Lay_Tarefas_btnClick(Sender: TObject);
    procedure Lay_Categorias_btnClick(Sender: TObject);
    procedure Lay_Objetivos_btnClick(Sender: TObject);
    procedure Lay_compras_btnClick(Sender: TObject);
    procedure Lay_usuarios_btnClick(Sender: TObject);
    procedure Lay_atualiazacoes_btnClick(Sender: TObject);
    procedure Lay_perguntas_btnClick(Sender: TObject);
    procedure TabPrincipalChange(Sender: TObject);
  private
    { Private declarations }
    FBtnVoltarClick : TProc;
  public
    { Public declarations }
    Function Exibir : TLayout;
    Function BtnVoltarClick (Value: TProc) : TForm_windows_ajuda;
  end;

var
  Form_Windows_Ajuda: TForm_Windows_Ajuda;

implementation

{$R *.fmx}

{ TForm_Windows_Ajuda }

function TForm_Windows_Ajuda.BtnVoltarClick(Value: TProc): TForm_windows_ajuda;
begin
  Result := Self;
  FBtnVoltarClick := value;
end;

procedure TForm_Windows_Ajuda.Btn_voltarClick(Sender: TObject);
begin
  if TabPrincipal.ActiveTab = TabHome then
   FBtnVoltarClick
  else
   TabPrincipal.GotoVisibleTab(TabHome.Index);
end;

function TForm_Windows_Ajuda.Exibir: TLayout;
begin
  Result := Lay_main;
end;

procedure TForm_Windows_Ajuda.FormCreate(Sender: TObject);
begin
  Btn_Voltar_pagina.Visible := false;
  Btn_Avancar_Pagina.Visible := False;
  Btn_Home.Visible := false;
end;

procedure TForm_Windows_Ajuda.Lay_atualiazacoes_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabAtualizacao.Index);
end;

procedure TForm_Windows_Ajuda.Lay_Categorias_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabCategorias.Index);
end;

procedure TForm_Windows_Ajuda.Lay_compras_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabListas.Index);
end;

procedure TForm_Windows_Ajuda.Lay_Novidades_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabNovidades.Index);
end;

procedure TForm_Windows_Ajuda.Lay_Objetivos_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabMetas.Index);
end;

procedure TForm_Windows_Ajuda.Lay_perguntas_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabPerguntas.Index);
end;

procedure TForm_Windows_Ajuda.Lay_Tarefas_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabTarefas.Index);
end;

procedure TForm_Windows_Ajuda.Lay_usuarios_btnClick(Sender: TObject);
begin
  TabPrincipal.GotoVisibleTab(TabContas.Index);
end;

procedure TForm_Windows_Ajuda.TabPrincipalChange(Sender: TObject);
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
