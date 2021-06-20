unit eTasks.View.Android.Metas;

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
  FMX.Ani,
  FMX.Objects,
  FMX.TabControl,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Effects,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.StdCtrls,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.MultiView,
  eTasks.View.Dialogs.Factory;

type

  Modos = (mEditar, mInserir);

  Filtros = (SemFiltro, PrioridadeAlta, PrioridadeNormal, PrioridadeBaixa);

  TAndroid_metas = class(TForm)
    Lay_main: TLayout;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasMetas: TImage;
    title_EditaMeta: TImage;
    title_NovaMeta: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    TabMetas: TTabControl;
    TabMetas_lista: TTabItem;
    TabMetas_exibe: TTabItem;
    TabMetas_EditaNovo: TTabItem;
    Lay_Topo_lista: TLayout;
    Lay_search: TLayout;
    Rec_caixa_pesquisa: TRectangle;
    ShadowEffect2: TShadowEffect;
    Img_pesquisar: TImage;
    Ed_pesquisa: TEdit;
    Btn_filtro_metas: TImage;
    ListagemMetas: TListView;
    Btn_Add_Meta: TImage;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_Metas: TImage;
    Seta_Sem_Metas: TImage;
    Img_meta_concluida: TImage;
    Img_meta_concluir: TImage;
    Img_prioridade_alta: TImage;
    Img_prioridade_baixa: TImage;
    Lay_container_meta: TLayout;
    Lay_container_status: TLayout;
    Btn_status: TImage;
    Label_meta: TLabel;
    Lay_descricao_exibe: TLayout;
    Linha_descricao_exibe: TLine;
    Lbl_descricao_title_exibe: TLabel;
    Lay_container_descricao_exibe: TLayout;
    Label_descricao: TLabel;
    Lay_prioridade_exibe: TLayout;
    Linha_categoria_title_exibe: TLine;
    Lbl_prioridade_exibe: TLabel;
    Lay_container_prioridade: TLayout;
    Lay_prioridade_btn: TLayout;
    Fundo_btn_prioridade: TRectangle;
    img_prioridade_btn: TImage;
    Lbl_prioridade_btn: TLabel;
    Btn_apaga_meta: TImage;
    Btn_edita_meta: TImage;
    Lay_meta: TLayout;
    Lay_tarefa_container: TLayout;
    Rec_tarefa: TRectangle;
    ShadowEffect1: TShadowEffect;
    Img_tarefa: TImage;
    Edit_meta: TEdit;
    Lay_descricao_edit: TLayout;
    Linha_descricao_edit: TLine;
    Label_descricao_edit: TLabel;
    Lay_descricao_container: TLayout;
    Lay_descricao_edit_cont: TLayout;
    Rect_descricao: TRectangle;
    sombra_descrcao_container: TShadowEffect;
    Ed_descricao: TMemo;
    Lay_prioridade_edit: TLayout;
    Linha_categoria_edit: TLine;
    Label_prioridade_edit: TLabel;
    Lay_prioridade_container: TLayout;
    Btn_OK: TImage;
    Lay_prioridade_alta: TLayout;
    Btn_prioridade_alta: TRectangle;
    Img_btn_prioridade_alta: TImage;
    Lbl_prioridade_btn_alta: TLabel;
    Lay_prioridade_normal: TLayout;
    btn_prioridade_normal: TRectangle;
    Lbl_prioridade_normal_btn: TLabel;
    seletor_Prioridade: TImage;
    Lay_prioridade_baixa: TLayout;
    btn_prioridade_baixa: TRectangle;
    Img_baixa_prioridade: TImage;
    Lbl_prioridade_baixa: TLabel;
    Menu_filtros: TMultiView;
    fundo_menu_filtro: TRectangle;
    ShadowEffect3: TShadowEffect;
    Menu_sem_filtro: TLayout;
    Menu_Prioridade_Alta: TLayout;
    Menu_Prioridade_normal: TLayout;
    Menu_prioridade_Baixa: TLayout;
    Img_menu_prioridade_alta: TImage;
    lbl_menu_prioridade_alta: TLabel;
    lbl_sem_filtro: TLabel;
    lbl_prioridade_menu_normal: TLabel;
    Seletor_filtro: TImage;
    Img_menu_prioridade_baixa: TImage;
    lbl_enu_prioridade_baixa: TLabel;
    StyleBook1: TStyleBook;
    ValidaMeta: TTimer;
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Menu_sem_filtroClick(Sender: TObject);
    procedure Menu_Prioridade_AltaClick(Sender: TObject);
    procedure Menu_Prioridade_normalClick(Sender: TObject);
    procedure Menu_prioridade_BaixaClick(Sender: TObject);
    procedure ListagemMetasItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure Btn_Add_MetaClick(Sender: TObject);
    procedure Btn_prioridade_altaClick(Sender: TObject);
    procedure btn_prioridade_normalClick(Sender: TObject);
    procedure btn_prioridade_baixaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Ed_descricaoEnter(Sender: TObject);
    procedure Ed_descricaoExit(Sender: TObject);
    procedure Btn_statusClick(Sender: TObject);
    procedure ValidaMetaTimer(Sender: TObject);
    procedure ListagemMetasPullRefresh(Sender: TObject);
    procedure Btn_edita_metaClick(Sender: TObject);
    procedure Btn_apaga_metaClick(Sender: TObject);
    procedure Edit_metaExit(Sender: TObject);
    procedure Ed_pesquisaTyping(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
  private
    { Private declarations }
    FId         : string;
    FMeta       : string;
    FDescricao  : string;
    FStatus     : string;
    FPrioridade : string;
    FModo       : Modos;
    FFiltro     : Filtros;
    Dialogs     : iViewDialogsFactory;
    Loading     : iViewDialogsFactory;
    Procedure Add_meta (id, meta, descricao, status, prioridade: string);
    Procedure ExibePrioridade (prioridade : string);
    Procedure ListarMetas (Filtro : Filtros);
    Procedure NovaMeta;
    Procedure EditaMeta;
    Procedure ExibeMeta;
    Procedure DeletaMeta;
  public
    { Public declarations }
  end;

var
  Android_metas: TAndroid_metas;

implementation

uses
  //eTasks - Controller units
  eTasks.Controller.Interfaces,
  eTasks.Controller.Factory,
  //eTasks - constantes de mensagens
  eTasks.View.Dialogs.Messages.Consts,
  //Outras Units importantes
  FMX.VirtualKeyboard,
  FMX.Platform;

{$R *.fmx}

procedure TAndroid_metas.Add_meta(id, meta, descricao, status,
  prioridade: string);
begin
  with ListagemMetas.Items.Add do
   begin
     TListItemText(Objects.FindDrawable('txt_titulo')).Text := meta;

     TListItemText(objects.FindDrawable('txt_description')).Text := descricao;

     if status = 'Concluir' then
      begin
        TListItemImage(Objects.FindDrawable('img_status')).Bitmap := Img_meta_concluir.Bitmap;
        TListItemImage(Objects.FindDrawable('img_status')).TagString := 'Concluir';
      end
     else
      begin
        TListItemImage(Objects.FindDrawable('img_status')).Bitmap := Img_meta_concluida.Bitmap;
        TListItemImage(Objects.FindDrawable('img_status')).TagString := 'Concluida';
      end;

     if prioridade = 'Alta' then
      begin
       TListItemImage(Objects.FindDrawable('img_prioridade')).Bitmap := Img_menu_prioridade_alta.Bitmap;
       TListItemImage(Objects.FindDrawable('img_prioridade')).Visible := true;
      end;
     if prioridade = 'Notmal' then
      TListItemImage(Objects.FindDrawable('img_prioridade')).Visible := False;
     if prioridade = 'Baixa' then
      begin
       TListItemImage(Objects.FindDrawable('img_prioridade')).Bitmap := Img_menu_prioridade_baixa.Bitmap;
       TListItemImage(Objects.FindDrawable('img_prioridade')).Visible := true;
      end;

     TagString := id;
   end;
end;

procedure TAndroid_metas.AnimaStatusFinish(Sender: TObject);
begin
  if AnimaStatus.Inverse = False then
   begin
    AnimaStatus.Inverse := true;
   end
  else
   begin
    AnimaStatus.Inverse := false;
    ModalResult := mrOk;
   end;
end;

procedure TAndroid_metas.Botao_voltarClick(Sender: TObject);
begin
  if TabMetas.ActiveTab <> TabMetas_lista then
   TabMetas.GotoVisibleTab(TabMetas_lista.Index)
  else
   AnimaStatus.Start;
end;

procedure TAndroid_metas.Btn_Add_MetaClick(Sender: TObject);
begin
  NovaMeta;
end;

procedure TAndroid_metas.Btn_apaga_metaClick(Sender: TObject);
begin
  DeletaMeta;
end;

procedure TAndroid_metas.Btn_edita_metaClick(Sender: TObject);
begin
  EditaMeta;
end;

procedure TAndroid_metas.Btn_OKClick(Sender: TObject);
begin
  ValidaMeta.Enabled := false;
  TabMetas.GotoVisibleTab(TabMetas_lista.Index);
end;

procedure TAndroid_metas.Btn_prioridade_altaClick(Sender: TObject);
begin
  seletor_Prioridade.Parent := Lay_prioridade_alta;
  FPrioridade := 'Alta';
end;

procedure TAndroid_metas.btn_prioridade_baixaClick(Sender: TObject);
begin
  seletor_Prioridade.Parent := Lay_prioridade_baixa;
  FPrioridade := 'Baixa';
end;

procedure TAndroid_metas.btn_prioridade_normalClick(Sender: TObject);
begin
  seletor_Prioridade.Parent := Lay_prioridade_normal;
  FPrioridade := 'Normal';
end;

procedure TAndroid_metas.Btn_statusClick(Sender: TObject);
begin
  if Btn_status.TagString = 'Concluir' then
   begin
     Btn_status.Bitmap := Img_meta_concluida.Bitmap;
     Btn_status.TagString := 'Concluida';
   end
  else
   begin
     Btn_status.Bitmap := Img_meta_concluir.Bitmap;
     Btn_status.TagString := 'Concluir';
   end;
end;

procedure TAndroid_metas.DeletaMeta;
begin

end;

procedure TAndroid_metas.EditaMeta;
begin
  FId         := '';
  Edit_meta.Text := FMeta;
  if FDescricao = '' then
   begin
    Ed_descricao.Lines.Clear;
    Ed_descricao.FontColor := $FF686868;
    Ed_descricao.Lines.Add('Digite aqui uma descrição para a tarefa');
   end
  else
   begin
    Ed_descricao.Lines.Clear;
    Ed_descricao.FontColor := $FF000000;
    Ed_descricao.Lines.Add(FDescricao);
   end;
  if FPrioridade = 'Baixa' then
   seletor_Prioridade.Parent := Lay_prioridade_baixa;
  if FPrioridade = 'Normal' then
   seletor_Prioridade.Parent := Lay_prioridade_Normal;
  if FPrioridade = 'Alta' then
   seletor_Prioridade.Parent := Lay_prioridade_Alta;
  FModo := mEditar;
  TabMetas.GotoVisibleTab(TabMetas_EditaNovo.Index);
  ValidaMeta.Enabled := true;
end;

procedure TAndroid_metas.Edit_metaExit(Sender: TObject);
begin
  FMeta := Edit_meta.Text;
end;

procedure TAndroid_metas.Ed_descricaoEnter(Sender: TObject);
begin
  if Ed_descricao.Lines.Text = 'Digite aqui uma descrição para a sua meta' then
   begin
     Ed_descricao.FontColor := $FF000000;
     Ed_descricao.Lines.Clear;
   end;
end;

procedure TAndroid_metas.Ed_descricaoExit(Sender: TObject);
begin
  if Ed_descricao.Lines.Text = '' then
   begin
     Ed_descricao.FontColor := $FF686868;
     Ed_descricao.Lines.Text := 'Digite aqui uma descrição para a sua meta';
     FDescricao := '';
   end
  else
   FDescricao := Ed_descricao.Lines.Text;
end;

procedure TAndroid_metas.Ed_pesquisaTyping(Sender: TObject);
begin
  if Ed_pesquisa.Text <> '' then
   ListagemMetas.Items.Filter := Function (Pesquisa: string) : Boolean
                                 Var Contador : integer;
                                 begin
                                   Contador := Pos(Ed_pesquisa.Text.ToUpper, pesquisa.ToUpper);
                                   Result := contador <> 0;
                                 end
  else
   ListagemMetas.Items.Filter := Function (Pesquisa: string) : Boolean
                                 Begin
                                   Result := True;
                                 End;
end;

procedure TAndroid_metas.ExibeMeta;
begin

end;

procedure TAndroid_metas.ExibePrioridade(prioridade: string);
begin
  if prioridade = 'Alta' then
   begin
     Fundo_btn_prioridade.Fill.Color := $FFF44336;
     img_prioridade_btn.Visible := true;
     img_prioridade_btn.Bitmap := Img_menu_prioridade_alta.Bitmap;
     Lbl_prioridade_btn.Text := 'Prioridade Alta';
   end;
  if prioridade = 'Normal' then
   begin
     Fundo_btn_prioridade.Fill.Color := $FF336699;
     img_prioridade_btn.Visible := false;
     Lbl_prioridade_btn.Text := 'Prioridade Normal';
   end;
  if prioridade = 'Baixa' then
   begin
     Fundo_btn_prioridade.Fill.Color := $FF8BC34A;
     img_prioridade_btn.Visible := true;
     img_prioridade_btn.Bitmap := Img_menu_prioridade_baixa.Bitmap;
     Lbl_prioridade_btn.Text := 'Prioridade Baixa';
   end;
end;

procedure TAndroid_metas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  Android_metas := nil;
end;

procedure TAndroid_metas.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
Var
  FService : iFMXVirtualKeyboardService;
begin
   if (Key = vkHardwareBack) then
    begin
      TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
      if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
       begin
         // Botão BACK pressionado e teclado vísivel, apenas fecha o teclado
       end
      else
       begin
         if (Assigned(Dialogs)) or (Assigned(Loading)) then
          begin
            Key := 0;
            if Assigned(dialogs) then
             begin
              dialogs.DialogMessages.Fechar;
             end;
          end
         else
          begin
           Key := 0;
           Botao_voltarClick(sender);
          end;
       end;
    end;
end;

procedure TAndroid_metas.FormShow(Sender: TObject);
begin
  AnimaStatus.Start;
  FFiltro := SemFiltro;
  ListarMetas(FFiltro);
end;

procedure TAndroid_metas.ListagemMetasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if TListView(sender).Selected <> nil then
   begin
     if ItemObject is TListItemImage then
      begin
        if ItemObject.Name = 'img_status' then
         begin
           if ItemObject.TagString = 'Concluir' then
            begin
              TListItemImage(ItemObject).Bitmap := Img_meta_concluida.Bitmap;
              ItemObject.TagString := 'Concluida';
            end
           else
            begin
              TListItemImage(ItemObject).Bitmap := Img_meta_concluir.Bitmap;
              ItemObject.TagString := 'Concluir';
            end;
         end
        else
         begin
           TabMetas.GotoVisibleTab(TabMetas_exibe.Index);
           Btn_status.Bitmap := Img_meta_concluir.Bitmap;
           Btn_status.TagString := 'Concluir';
           if TListView(sender).Items[ItemIndex].TagString = '001' then
            ExibePrioridade('Alta');
           if TListView(sender).Items[ItemIndex].TagString = '002' then
            ExibePrioridade('Normal');
           if TListView(sender).Items[ItemIndex].TagString = '003' then
            ExibePrioridade('Baixa');
         end;
      end
     else
      begin
           TabMetas.GotoVisibleTab(TabMetas_exibe.Index);
           Btn_status.Bitmap := Img_meta_concluir.Bitmap;
           Btn_status.TagString := 'Concluir';
           if TListView(sender).Items[ItemIndex].TagString = '001' then
            ExibePrioridade('Alta');
           if TListView(sender).Items[ItemIndex].TagString = '002' then
            ExibePrioridade('Normal');
           if TListView(sender).Items[ItemIndex].TagString = '003' then
            ExibePrioridade('Baixa');
      end;
   end;
end;

procedure TAndroid_metas.ListagemMetasPullRefresh(Sender: TObject);
begin
  ListarMetas(FFiltro);
end;

procedure TAndroid_metas.ListarMetas(Filtro: Filtros);
begin
 ListagemMetas.Items.Clear;
 case Filtro of
   SemFiltro: begin
                Add_meta('001', 'eTasks', 'Terminar o projeto do eTasks', 'Concluir', 'Alta');
                Add_meta('002', 'Firebase', 'Terminar o projeto do eVendas', 'Concluir', 'Normal');
                Add_meta('003', 'Terminar projeto 3', 'Terminar o projeto do eFirebase', 'Concluida', 'Baixa');
              end;
   PrioridadeAlta: begin
                    Add_meta('001', 'Terminar projeto 1', 'Terminar o projeto do eTasks', 'Concluir', 'Alta');
                   end;
   PrioridadeNormal: begin
                       Add_meta('002', 'Terminar projeto 2', 'Terminar o projeto do eVendas', 'Concluir', 'Normal');
                     end;
   PrioridadeBaixa: begin
                      Add_meta('003', 'Terminar projeto 3', 'Terminar o projeto do eFirebase', 'Concluida', 'Baixa');
                    end;
 end;


end;

procedure TAndroid_metas.Menu_Prioridade_AltaClick(Sender: TObject);
begin
  Seletor_filtro.Parent := Menu_Prioridade_Alta;
  Menu_filtros.HideMaster;
  FFiltro := PrioridadeAlta;
  ListarMetas(FFiltro);
end;

procedure TAndroid_metas.Menu_prioridade_BaixaClick(Sender: TObject);
begin
  Seletor_filtro.Parent := Menu_prioridade_Baixa;
  Menu_filtros.HideMaster;
  FFiltro := PrioridadeBaixa;
  ListarMetas(FFiltro);
end;

procedure TAndroid_metas.Menu_Prioridade_normalClick(Sender: TObject);
begin
  Seletor_filtro.Parent := Menu_Prioridade_normal;
  Menu_filtros.HideMaster;
  FFiltro := PrioridadeNormal;
  ListarMetas(FFiltro);
end;

procedure TAndroid_metas.Menu_sem_filtroClick(Sender: TObject);
begin
  Seletor_filtro.Parent := Menu_sem_filtro;
  Menu_filtros.HideMaster;
  FFiltro := SemFiltro;
  ListarMetas(FFiltro);
end;

procedure TAndroid_metas.NovaMeta;
begin
  FId         := '';
  FMeta       := '';
  FDescricao  := '';
  FStatus     := 'Concluir';
  FPrioridade := 'Normal';
  Edit_meta.Text := '';
  Ed_descricao.Lines.Clear;
  Ed_descricao.FontColor := $FF686868;
  Ed_descricao.Lines.Add('Digite aqui uma descrição para a tarefa');
  seletor_Prioridade.Parent := Lay_prioridade_normal;
  TabMetas.GotoVisibleTab(TabMetas_EditaNovo.Index);
  ValidaMeta.Enabled := true;
end;

procedure TAndroid_metas.ValidaMetaTimer(Sender: TObject);
begin
  Btn_OK.enabled := (not Edit_meta.Text.IsEmpty);
end;

end.
