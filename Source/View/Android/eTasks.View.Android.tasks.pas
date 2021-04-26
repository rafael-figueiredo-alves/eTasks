unit eTasks.View.Android.tasks;

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
  FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts,
  FMX.TabControl,
  FMX.Objects,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Ani,
  //eTasks - View dialogs factory
  eTasks.View.Dialogs.Factory, FMX.Effects, FMX.Edit, FMX.ScrollBox, FMX.Memo;

type
  tipo_acao = (taNovo, taEditar, taExibe, taLista);

  Telas = (TelaCategorias);

  Modos = (mEditar, mInserir);

  TTela_Tarefas = class(TForm)
    Lay_main: TLayout;
    TabTarefas: TTabControl;
    TabListaTarefa: TTabItem;
    TabExibeTarefa: TTabItem;
    TabNovoEditaTarefa: TTabItem;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasTarefas: TImage;
    title_EditaTarefa: TImage;
    title_NovaTarefa: TImage;
    Lay_Topo_lista: TLayout;
    Lay_data_select: TLayout;
    Btn_Volta_data: TImage;
    Btn_Avanca_data: TImage;
    Label_Data: TLabel;
    ListaTarefas: TListView;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_tarefas: TImage;
    Label_sem_tarefas: TLabel;
    Img_Afazer: TImage;
    Img_Concluido: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    Btn_Add_tarefa: TImage;
    Btn_apaga_task: TImage;
    Btn_edita_task: TImage;
    Lay_container_tarefa: TLayout;
    Lay_container_status: TLayout;
    Btn_status: TImage;
    Label_tarefa: TLabel;
    Lay_descricao_exibe: TLayout;
    Linha_descricao_exibe: TLine;
    Lbl_descricao_title_exibe: TLabel;
    Lay_categoria_exibe: TLayout;
    Linha_categoria_title_exibe: TLine;
    Lbl_categoria_exibe: TLabel;
    Lay_data_exibe: TLayout;
    Linha_data_exibe: TLine;
    Lbl_data_exibe: TLabel;
    Lay_container_descricao_exibe: TLayout;
    Lay_container_categoria: TLayout;
    Img_Categoria_exibe: TImage;
    Label_categoria: TLabel;
    Label_data_exibe: TLabel;
    Label_descricao: TLabel;
    Btn_OK: TImage;
    Lay_tarefa: TLayout;
    Lay_tarefa_container: TLayout;
    Rec_tarefa: TRectangle;
    ShadowEffect1: TShadowEffect;
    Img_tarefa: TImage;
    Edit_tarefa: TEdit;
    Lay_descricao_edit: TLayout;
    Linha_descricao_edit: TLine;
    Label_descricao_edit: TLabel;
    Lay_descricao_container: TLayout;
    Lay_descricao_edit_cont: TLayout;
    Rect_descricao: TRectangle;
    sombra_descrcao_container: TShadowEffect;
    Lay_categoria_edit: TLayout;
    Linha_categoria_edit: TLine;
    Label_categoria_edit: TLabel;
    Lay_categoria_container: TLayout;
    Lay_container_categoria_edit: TLayout;
    Btn_categoria: TRectangle;
    ShadowEffect3: TShadowEffect;
    Img_categoria_btn: TImage;
    Img_categoria_abrir: TImage;
    Label_categoria_btn: TLabel;
    Lay_data_edit: TLayout;
    Linha_data_edit: TLine;
    Label_data_edit: TLabel;
    Ed_descricao: TMemo;
    Estilo_tasks: TStyleBook;
    Lay_data_edit_container: TLayout;
    lay_container_data_edit: TLayout;
    Btn_data: TRectangle;
    ShadowEffect4: TShadowEffect;
    Img_data: TImage;
    img_btn_data_abre: TImage;
    Label_data_btn: TLabel;
    Rect_abrir_categorias: TRectangle;
    ShadowEffect2: TShadowEffect;
    AnimaTelaCategorias: TFloatAnimation;
    ValidaTarefa: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Btn_Avanca_dataClick(Sender: TObject);
    procedure Btn_Volta_dataClick(Sender: TObject);
    procedure Label_DataClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Btn_statusClick(Sender: TObject);
    procedure Btn_dataClick(Sender: TObject);
    procedure AnimaTelaCategoriasFinish(Sender: TObject);
    procedure Btn_categoriaClick(Sender: TObject);
    procedure ListaTarefasItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Btn_Add_tarefaClick(Sender: TObject);
    procedure TabTarefasChange(Sender: TObject);
    procedure Btn_edita_taskClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ed_descricaoEnter(Sender: TObject);
    procedure Ed_descricaoExit(Sender: TObject);
    procedure ValidaTarefaTimer(Sender: TObject);
  private
    { Private declarations }
    {FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject;
                                    var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;}
    Fid        : string;
    FTarefa    : string;
    FDescricao : string;
    Fdata      : string;
    Fstatus    : string;
    FCategoria : string;
    Fcat_id    : string;
    Fcat_icon  : string;
    FTipoAcao  : tipo_acao;
    FTelas     : Telas;
    FModo      : Modos;
    FMain      : Boolean;
    FBack      : Boolean;
    Dialogs    : iViewDialogsFactory;
    Loading    : iViewDialogsFactory;
    FCalendar  : iViewDialogsFactory;
    Procedure Add_tarefa (id, Status, tarefa, descricao: string; categoria: string);
    Procedure ListarTarefas(Data : string);
    Procedure AtualizaListaTarefas(Data : string);
    Procedure AbreTela (Tela : Telas);
    Procedure EditarTarefa(Main : Boolean);
    Procedure NovaTarefa(Main : Boolean);
    Procedure ExibeTarefa(Main : Boolean);
  public
    { Public declarations }
    Procedure Acao (Acao : tipo_acao);
    Procedure ID (value : string);
  end;

var
  Tela_Tarefas: TTela_Tarefas;

implementation

uses
  //Required units
  FMX.platform,
  FMX.VirtualKeyboard,
  //eTasks - Controller units
  eTasks.Controller.Interfaces,
  eTasks.Controller.Factory,
  //eTasks - Libraries
  eTasks.libraries.Android,
  eTasks.libraries.Imagens64,
  eTasks.libraries,
  eTasks.view.categorias,
  //eTasks - Form de Categorias
  eTasks.View.Android.categories;

{$R *.fmx}

procedure TTela_Tarefas.AbreTela(Tela: Telas);
begin
  FTelas := Tela;
  AnimaTelaCategorias.Start;
end;

procedure TTela_Tarefas.Acao(Acao: tipo_acao);
begin
  FTipoAcao := Acao;
end;

procedure TTela_Tarefas.Add_tarefa(id, Status, tarefa, descricao,
  categoria: string);
Var
 img : TBitmap;
 picture : TImage;
begin
  with ListaTarefas.Items.Add do
  begin
    TListItemText(Objects.FindDrawable('txt_titulo')).Text := tarefa;

    if Status = 'fazer' then
     begin
      TListItemImage(Objects.FindDrawable('img_status')).Bitmap := Img_Afazer.Bitmap;
      TListItemImage(Objects.FindDrawable('img_status')).TagString := 'fazer';
     end
    else
     begin
      TListItemImage(Objects.FindDrawable('img_status')).Bitmap := Img_Concluido.Bitmap;
      TListItemImage(Objects.FindDrawable('img_status')).TagString := 'concluido';
     end;

    TListItemText(Objects.FindDrawable('txt_description')).Text := descricao;

    img := TImagens64.fromBase64(tcategorias.New.PegaImagem(categoria));
    picture := TImage.Create(nil);
    try
     TListItemImage(Objects.FindDrawable('img_category')).OwnsBitmap := True;
     picture.Bitmap := img;
     TListItemImage(Objects.FindDrawable('img_category')).Bitmap := picture.Bitmap;
     img.disposeof;
    finally
     picture.DisposeOf;
    end;

    TagString := id;
  end;
end;

procedure TTela_Tarefas.AnimaStatusFinish(Sender: TObject);
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

procedure TTela_Tarefas.AnimaTelaCategoriasFinish(Sender: TObject);
begin
  if AnimaTelaCategorias.Inverse = false then
   begin
     AnimaTelaCategorias.Inverse := True;
     case FTelas of
      TelaCategorias : begin
                          if not Assigned(Tela_categorias) then
                            Application.CreateForm(TTela_categorias, Tela_categorias);
                          Tela_Categorias.Acao(taSelecionar);
                          Tela_Categorias.ShowModal(Procedure (ModalResult: TModalResult)
                                                    var
                                                     bitmap : TBitmap;
                                                    Begin
                                                     AnimaTelaCategorias.Start;
                                                     if ModalResult = mrOk then
                                                      begin
                                                        bitmap := TImagens64.fromBase64(TCategorias.New.PegaImagem(Tela_categorias.cat_icon));
                                                        FCategoria := Tela_categorias.Categoria;
                                                        Fcat_id    := Tela_categorias.Cat_id;
                                                        Fcat_icon  := Tela_categorias.cat_icon;
                                                        Label_categoria_btn.Text := FCategoria;
                                                        Img_categoria_btn.Bitmap := bitmap;
                                                        Img_categoria_btn.Visible := true;
                                                        bitmap.DisposeOf;
                                                      end;
                                                    End);
                       end;
     end;
   end
  else
   AnimaTelaCategorias.Inverse := False;
end;

procedure TTela_Tarefas.AtualizaListaTarefas(Data: string);
Var
  erro : string;
  Tarefas : iControllerTarefas;
  Loading :  iViewDialogsFactory;
begin
  teTasksLibrary.CustomThread(Procedure()
                              begin
                                Loading := tviewdialogsmessages.New;
                                Tela_tarefas.AddObject(
                                                             Loading.Loading
                                                                      .Mensagem('Buscando tarefas. Aguarde, por favor... ')
                                                                      .AcaoLimpa(Procedure()
                                                                                 begin
                                                                                  Loading := nil;
                                                                                 end)
                                                                      .Exibe
                                                            );
                              end,
                              Procedure ()
                              begin
                                Tarefas := tcontrollerFactory.New.Tarefas.data(data).ListarTarefas(erro);
                              end,
                              Procedure ()
                              Var
                               tarefa : TTarefa;
                              begin
                                loading.Loading.Fechar;
                                if erro = '' then
                                 begin
                                  listaTarefas.Items.Clear;
                                  Lay_Lista_vazia.Visible := False;
                                  if Tarefas.ListagemdeTarefas.Count <> 0 then
                                   begin
                                    ListaTarefas.BeginUpdate;
                                    for Tarefa in Tarefas.ListagemdeTarefas.Values do
                                     Add_tarefa(Tarefa.id, Tarefa.status, Tarefa.tarefa, Tarefa.descricao, Tarefa.Cat_icon);
                                    ListaTarefas.EndUpdate;
                                   end
                                  else
                                   Lay_Lista_vazia.Visible := True;
                                 end
                                else
                                 begin
                                   if erro = 'vazio' then
                                    Begin
                                      ListaTarefas.Items.Clear;
                                      Lay_Lista_vazia.Visible := True;
                                    End;
                                 end;
                              end);
end;

procedure TTela_Tarefas.Botao_voltarClick(Sender: TObject);
begin
  //ModalResult := mrOk;
  if (FMain = true) then
   begin
     if (TabTarefas.ActiveTab = TabNovoEditaTarefa) and (FBack = true) then
      begin
       TabTarefas.GotoVisibleTab(TabExibeTarefa.Index);
       ValidaTarefa.Enabled := false;
      end
     else
      AnimaStatus.Start;
   end
  else
   begin
     if (TabTarefas.ActiveTab = TabNovoEditaTarefa) then
      begin
       if FModo = mEditar then
        TabTarefas.GotoVisibleTab(TabExibeTarefa.Index)
       else
        TabTarefas.GotoVisibleTab(TabListaTarefa.Index);
       ValidaTarefa.Enabled := false;
      end
     else
      begin
       if TabTarefas.ActiveTab = TabExibeTarefa then
        TabTarefas.GotoVisibleTab(TabListaTarefa.Index)
       else
        AnimaStatus.Start;
      end;
   end;
end;

procedure TTela_Tarefas.Btn_Add_tarefaClick(Sender: TObject);
begin
  FModo := mInserir;
  NovaTarefa(false);
end;

procedure TTela_Tarefas.Btn_Avanca_dataClick(Sender: TObject);
begin
   ListarTarefas(DateToStr(StrToDate(Label_Data.Text) + 1));
end;

procedure TTela_Tarefas.Btn_categoriaClick(Sender: TObject);
begin
  AbreTela(TelaCategorias);
end;

procedure TTela_Tarefas.Btn_dataClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  FCalendar := TViewDialogsMessages.New;
  FData := DateToStr(now);
  Tela_tarefas.AddObject(
                               FCalendar.Calendar
                                            .Data(StrToDate(Fdata))
                                            .AcaoBotao(Procedure ()
                                                       begin
                                                         Fdata := DateToStr(FCalendar.Calendar.Data);
                                                         Label_data_btn.Text := FormatDateTime('dd "de" mmmm "de" yyyy', StrToDate(Fdata));
                                                         FCalendar := nil;
                                                       end)
                                            .AcaoFundo(Procedure ()
                                                       begin
                                                         FCalendar := nil;
                                                       end)
                                            .Exibe);
end;

procedure TTela_Tarefas.Btn_edita_taskClick(Sender: TObject);
begin
  FModo := mEditar;
  EditarTarefa(FMain);
end;

procedure TTela_Tarefas.Btn_statusClick(Sender: TObject);
Var
  ErroStatus : string;
begin
  if Btn_status.TagString = 'fazer' then
   begin
     TControllerFactory.New.Tarefas
                         .id(Fid)
                         .Status('concluido')
                         .MudaStatus(ErroStatus);
     if ErroStatus = '' then
      begin
       Btn_status.Bitmap    := Img_Concluido.Bitmap;
       Btn_status.TagString := 'concluido';
       Fstatus              := 'concluido';
      end;
   end
  else
   begin
     TControllerFactory.New.Tarefas
                         .id(Fid)
                         .Status('fazer')
                         .MudaStatus(ErroStatus);
     if ErroStatus = '' then
      begin
       Btn_status.Bitmap    := Img_Afazer.Bitmap;
       Btn_status.TagString := 'fazer';
       Fstatus              := 'fazer';
      end;
   end;
end;

procedure TTela_Tarefas.Btn_Volta_dataClick(Sender: TObject);
begin
  ListarTarefas(DateToStr(StrToDate(Label_Data.Text) - 1));
end;

procedure TTela_Tarefas.EditarTarefa(Main : Boolean);
begin
  TabTarefas.GotoVisibleTab(TabNovoEditaTarefa.Index);

  ValidaTarefa.Enabled        := true;
  title_MinhasTarefas.Visible := False;
  title_EditaTarefa.Visible   := True;
  title_NovaTarefa.Visible    := False;

  Edit_tarefa.Text          := FTarefa;
  Ed_descricao.Lines.Clear;
  Ed_descricao.Lines.Add(FDescricao);
  Img_categoria_btn.Visible := true;
  Img_categoria_btn.Bitmap  := Img_Categoria_exibe.Bitmap;
  Label_categoria_btn.Text  := FCategoria;
  Label_data_btn.Text       := Label_data_exibe.Text;

end;

procedure TTela_Tarefas.Ed_descricaoEnter(Sender: TObject);
begin
  if Ed_descricao.Lines.Text = 'Digite aqui uma descrição para a tarefa' then
   begin
     Ed_descricao.FontColor := $FF000000;
     Ed_descricao.Lines.Clear;
   end;
end;

procedure TTela_Tarefas.Ed_descricaoExit(Sender: TObject);
begin
  if Ed_descricao.Lines.Text = '' then
   begin
     Ed_descricao.FontColor := $FF686868;
     Ed_descricao.Lines.Text := 'Digite aqui uma descrição para a tarefa';
   end;
end;

procedure TTela_Tarefas.ExibeTarefa(Main : Boolean);
Var
  Erro    : string;
  Tarefas : iControllerTarefas;
  bitmap  : TBitmap;
begin
  if main then
   TabTarefas.ActiveTab := TabExibeTarefa
  else
   TabTarefas.GotoVisibleTab(TabExibeTarefa.Index);

  title_MinhasTarefas.Visible := True;
  title_EditaTarefa.Visible   := False;
  title_NovaTarefa.Visible    := False;

  Tarefas := tcontrollerfactory.New.Tarefas;
  Tarefas.id(Fid);
  Tarefas.ExibeTarefa(Erro);

  FTarefa    := Tarefas.tarefa;
  FDescricao := Tarefas.descricao;
  Fdata      := Tarefas.data;
  FCategoria := Tarefas.categoria;
  Fcat_id    := Tarefas.cat_id;
  Fcat_icon  := Tarefas.Cat_icon;
  Fstatus    := Tarefas.Status;

  Label_tarefa.Text     := FTarefa;
  Label_descricao.Text  := Fdescricao;
  Label_categoria.Text  := FCategoria;
  Label_data_exibe.Text := FormatDateTime('dd "de" mmmm "de" yyyy', StrToDate(Fdata));

  if Fstatus = 'fazer' then
   Btn_status.Bitmap := Img_Afazer.Bitmap
  else
   Btn_status.Bitmap := Img_Concluido.Bitmap;
  Btn_status.TagString := Fstatus;

  bitmap := TImagens64.fromBase64(TCategorias.New.PegaImagem(Fcat_icon));
  Img_Categoria_exibe.Bitmap := bitmap;
  bitmap.DisposeOf;
end;

procedure TTela_Tarefas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Tela_categorias) then
   begin
     Tela_categorias.DisposeOf;
     Tela_categorias := nil;
   end;
  Action := TCloseAction.caFree;
  Tela_Tarefas := nil;
end;

procedure TTela_Tarefas.FormKeyUp(Sender: TObject; var Key: Word;
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
         if (Assigned(Dialogs)) or (Assigned(Loading)) or (Assigned(FCalendar)) then
          begin
            Key := 0;
            if Assigned(dialogs) then
             begin
              dialogs.DialogMessages.Fechar;
             end;
            if Assigned(FCalendar) then
             begin
              FCalendar.Calendar.Fechar;
             end;
          end
         else
          begin
           Key := 0;
           if (FMain = true) then
            begin
             if (TabTarefas.ActiveTab = TabNovoEditaTarefa) and (FBack = true) then
              begin
               TabTarefas.GotoVisibleTab(TabExibeTarefa.Index);
               ValidaTarefa.Enabled := false;
              end
             else
              AnimaStatus.Start;
            end
           else
            begin
             if (TabTarefas.ActiveTab = TabNovoEditaTarefa) then
              begin
               if FModo = mEditar then
                TabTarefas.GotoVisibleTab(TabExibeTarefa.Index)
               else
                TabTarefas.GotoVisibleTab(TabListaTarefa.Index);
               ValidaTarefa.Enabled := false;
              end
             else
              begin
               if TabTarefas.ActiveTab = TabExibeTarefa then
                TabTarefas.GotoVisibleTab(TabListaTarefa.Index)
               else
                AnimaStatus.Start;
              end;
            end;
          end;
       end;
    end;
end;

procedure TTela_Tarefas.FormShow(Sender: TObject);
begin
  case FTipoAcao of
    taNovo: begin
             FMain := True;
             FBack := False;
             FModo := mInserir;
             NovaTarefa(FMain);
            end;
    taExibe: begin
               FMain := true;
               FBack := True;
               ExibeTarefa(FMain);
             end;
    taLista: begin
              FMain := False;
              FBack := True;
              title_MinhasTarefas.Visible := True;
              title_EditaTarefa.Visible   := False;
              title_NovaTarefa.Visible    := False;
              TabTarefas.ActiveTab        := TabListaTarefa;
              ListarTarefas(DateToStr(now));
             end;
  end;
  AnimaStatus.Start;
end;

procedure TTela_Tarefas.ID(value: string);
begin
  Fid := value;
end;

procedure TTela_Tarefas.Label_DataClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  FCalendar := TViewDialogsMessages.New;
  Tela_tarefas.AddObject(
                               FCalendar.Calendar
                                            .Data(StrToDate(Label_Data.Text))
                                            .AcaoBotao(Procedure ()
                                                       begin
                                                         ListarTarefas(DateToStr(FCalendar.Calendar.Data));
                                                         FCalendar := nil;
                                                       end)
                                            .AcaoFundo(Procedure ()
                                                       begin
                                                         FCalendar := nil;
                                                       end)
                                            .Exibe);
end;

procedure TTela_Tarefas.ListarTarefas(Data: string);
begin
  Label_Data.Text := Data;
  AtualizaListaTarefas(data);
end;


procedure TTela_Tarefas.ListaTarefasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
Var
  ErroStatus : string;
begin
  if TListView(sender).Selected <> nil then
   begin
     if ItemObject is TListItemImage then
      begin
        if ItemObject.Name = 'img_status' then
         begin
           if ItemObject.TagString = 'fazer' then
            begin
             TControllerFactory.New.Tarefas
                                     .id(TListView(sender).Items[ItemIndex].TagString)
                                     .Status('concluido')
                                     .MudaStatus(ErroStatus);
             if ErroStatus = '' then
              begin
                TListItemImage(ItemObject).Bitmap := Img_Concluido.Bitmap;
                ItemObject.TagString := 'concluido';
              end;
            end
           else
            begin
             TControllerFactory.New.Tarefas
                                     .id(TListView(sender).Items[ItemIndex].TagString)
                                     .Status('fazer')
                                     .MudaStatus(ErroStatus);
             if ErroStatus = '' then
              begin
               TListItemImage(ItemObject).Bitmap := Img_Afazer.Bitmap;
               ItemObject.TagString := 'fazer';
              end;
            end;
         end;

      end
     else
      begin
        Fid := TListView(sender).Items[ItemIndex].TagString;
        FMain := False;
        ExibeTarefa(false);
      end;

   end;
end;

procedure TTela_Tarefas.NovaTarefa(Main : Boolean);
begin
  if Main then
   TabTarefas.ActiveTab := TabNovoEditaTarefa
  else
   TabTarefas.GotoVisibleTab(TabNovoEditaTarefa.Index);
  ValidaTarefa.Enabled        := true;
  title_MinhasTarefas.Visible := False;
  title_EditaTarefa.Visible   := False;
  title_NovaTarefa.Visible    := True;
  Img_categoria_btn.Visible   := false;
  Label_categoria_btn.Text    := 'Selecione uma categoria';
  Ed_descricao.Lines.Clear;
  Ed_descricao.FontColor := $FF686868;
  Ed_descricao.Lines.Add('Digite aqui uma descrição para a tarefa');
  Edit_tarefa.Text  := '';
  Fid := '';
  FTarefa := '';
  FDescricao := '';
  Fdata := DateToStr(now);
  Label_data_btn.Text := FormatDateTime('dd "de" mmmm "de" yyyy', StrToDate(Fdata));
  FCategoria := '';
  Fcat_id    := '';
  Fcat_icon  := '';
  Fstatus    := 'fazer';
end;

procedure TTela_Tarefas.TabTarefasChange(Sender: TObject);
begin
  case TabTarefas.ActiveTab.Index of
   0: begin                                    //tabPrincipal ou Lista
       title_MinhasTarefas.Visible := True;
       title_EditaTarefa.Visible   := False;
       title_NovaTarefa.Visible    := False;
      end;
   1: begin                                     //tabExibe
       title_MinhasTarefas.Visible := True;
       title_EditaTarefa.Visible   := False;
       title_NovaTarefa.Visible    := False;
      end;
   2: begin                                      //tabEditaNovo
       if FModo = mEditar then
        begin
         title_MinhasTarefas.Visible := False;
         title_EditaTarefa.Visible   := True;
         title_NovaTarefa.Visible    := False;
        end
       else
        begin
         title_MinhasTarefas.Visible := False;
         title_EditaTarefa.Visible   := False;
         title_NovaTarefa.Visible    := True;
        end;
      end;
  end;
end;

procedure TTela_Tarefas.ValidaTarefaTimer(Sender: TObject);
begin
  Btn_OK.enabled := (not Edit_tarefa.Text.IsEmpty) and (Label_categoria_btn.Text <> 'Selecione uma categoria');
end;

end.
