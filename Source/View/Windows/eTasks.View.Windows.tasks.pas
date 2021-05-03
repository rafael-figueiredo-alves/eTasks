unit eTasks.View.Windows.tasks;

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
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.Ani,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Edit,
  FMX.Effects,
  FMX.Objects,
  FMX.ListView,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.TabControl,
  eTasks.View.Dialogs.Factory;

type
  tipo_acao = (taNovo, taEditar, taExibe, taLista);

  Modos = (mEditar, mInserir);

  TWindows_tasks = class(TForm)
    Img_Afazer: TImage;
    Img_Concluido: TImage;
    Lay_main: TLayout;
    TabTarefas: TTabControl;
    TabListaTarefa: TTabItem;
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
    Btn_Add_tarefa: TImage;
    TabExibeTarefa: TTabItem;
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
    Label_descricao: TLabel;
    Lay_container_categoria: TLayout;
    Img_Categoria_exibe: TImage;
    Label_categoria: TLabel;
    Label_data_exibe: TLabel;
    TabNovoEditaTarefa: TTabItem;
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
    Ed_descricao: TMemo;
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
    Lay_data_edit_container: TLayout;
    lay_container_data_edit: TLayout;
    Btn_data: TRectangle;
    ShadowEffect4: TShadowEffect;
    Img_data: TImage;
    img_btn_data_abre: TImage;
    Label_data_btn: TLabel;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasTarefas: TImage;
    title_EditaTarefa: TImage;
    title_NovaTarefa: TImage;
    Rect_abrir_categorias: TRectangle;
    ShadowEffect2: TShadowEffect;
    AnimaTelaCategorias: TFloatAnimation;
    Estilo_tasks: TStyleBook;
    ValidaTarefa: TTimer;
    Lay_container: TLayout;
    procedure Label_DataClick(Sender: TObject);
    procedure Btn_Volta_dataClick(Sender: TObject);
    procedure Btn_Avanca_dataClick(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure Btn_Add_tarefaClick(Sender: TObject);
    procedure ListaTarefasItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Btn_statusClick(Sender: TObject);
    procedure Btn_edita_taskClick(Sender: TObject);
    procedure Btn_apaga_taskClick(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure Btn_dataClick(Sender: TObject);
    procedure Btn_categoriaClick(Sender: TObject);
    procedure Ed_descricaoEnter(Sender: TObject);
    procedure Ed_descricaoExit(Sender: TObject);
    procedure Lay_mainResize(Sender: TObject);
    procedure AnimaTelaCategoriasFinish(Sender: TObject);
  private
    { Private declarations }
    FBtnVoltarClick : TProc;
    Fid        : string;
    FTarefa    : string;
    FDescricao : string;
    Fdata      : string;
    Fstatus    : string;
    FCategoria : string;
    Fcat_id    : string;
    Fcat_icon  : string;
    FTipoAcao  : tipo_acao;
    FModo      : Modos;
    FMain      : Boolean;
    FBack      : Boolean;
    Dialogs    : iViewDialogsFactory;
    Loading    : iViewDialogsFactory;
    FCalendar  : iViewDialogsFactory;
    Procedure Add_tarefa (id, Status, tarefa, descricao: string; categoria: string);
    Procedure ListarTarefas(Data : string);
    Procedure AtualizaListaTarefas(Data : string);
    Procedure AbreTelaCategorias;
    Procedure EditarTarefa(Main : Boolean);
    Procedure NovaTarefa(Main : Boolean);
    Procedure ExibeTarefa(Main : Boolean);
  public
    { Public declarations }
    Function Exibir : TLayout;
    Function BtnVoltarClick(Value : tProc) : Twindows_tasks;
    Procedure Acao (Acao : tipo_acao);
    Procedure ID (value : string);
  end;

var
  Windows_tasks: TWindows_tasks;

implementation

uses
  eTasks.libraries.Imagens64, eTasks.view.categorias,
  eTasks.Controller.Interfaces, eTasks.libraries, eTasks.View.Windows.main,
  eTasks.Controller.Factory, eTasks.View.Dialogs.Messages.Consts,
  eTasks.View.Windows.telas;

{$R *.fmx}

{ TWindows_tasks }

procedure TWindows_tasks.AbreTelaCategorias;
begin
  AnimaTelaCategorias.Start;
end;

procedure TWindows_tasks.Acao(Acao: tipo_acao);
begin
  FTipoAcao := Acao;
end;

procedure TWindows_tasks.Add_tarefa(id, Status, tarefa, descricao,
  categoria: string);
Var
 img : TBitmap;
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

    try
     TListItemImage(Objects.FindDrawable('img_category')).OwnsBitmap := True;

     TListItemImage(Objects.FindDrawable('img_category')).Bitmap := img;

    finally

    end;

    TagString := id;
  end;
end;

procedure TWindows_tasks.AnimaTelaCategoriasFinish(Sender: TObject);
Var
 FTelaCategorias : iwindowstelas;
begin
  if (AnimaTelaCategorias.Inverse = false) then
   begin
    AnimaTelaCategorias.Inverse := true;
    {FTelaCategorias := Form_Windows_Main.TelaCategoriasSelecionar;
    Lay_container.AddObject(
                             FTelaCategorias
                              .Tela_Categories
                                   .BtnVoltarClick(
                                                   Procedure ()
                                                   begin
                                                     AnimaTelaCategorias.Start;
                                                     FTelaCategorias := nil;
                                                   end
                                                  )
                                   .Exibir
                           );}
   end
  else
   AnimaTelaCategorias.Inverse := False;
end;

procedure TWindows_tasks.AtualizaListaTarefas(Data: string);
Var
  erro : string;
  Tarefas : iControllerTarefas;
  Loading :  iViewDialogsFactory;
begin
  teTasksLibrary.CustomThread(Procedure()
                              begin
                                Loading := tviewdialogsmessages.New;
                                Form_windows_main.AddObject(
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
                              end);
end;

procedure TWindows_tasks.Botao_voltarClick(Sender: TObject);
begin
  if (FMain = true) then
   begin
     if (TabTarefas.ActiveTab = TabNovoEditaTarefa) and (FBack = true) then
      begin
       TabTarefas.GotoVisibleTab(TabExibeTarefa.Index);
       ValidaTarefa.Enabled := false;
      end
     else
      FBtnVoltarClick;
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
        FBtnVoltarClick;
      end;
   end;
end;

function TWindows_tasks.BtnVoltarClick(Value: tProc): Twindows_tasks;
begin
  Result := Self;
  FBtnVoltarClick := value;
end;

procedure TWindows_tasks.Btn_Add_tarefaClick(Sender: TObject);
begin
  FModo := mInserir;
  NovaTarefa(false);
end;

procedure TWindows_tasks.Btn_apaga_taskClick(Sender: TObject);
Var
 erro      : string;
 FMensagem : tTipoMensagem;
begin
 Dialogs := TViewDialogsMessages.New;
 Form_Windows_Main
  .AddObject(
             Dialogs.Pai(Form_Windows_Main)
              .DialogYesNo
                .Messagem('Tem certeza que deseja apagar esta tarefa?')
                .BtnYes(
                        procedure ()
                        begin
                         Dialogs.DialogYesNo.Fechar;
                         Dialogs := nil;
                         teTasksLibrary
                           .CustomThread(
                                         procedure ()
                                         Begin
                                          Loading := TViewDialogsMessages.New;
                                          Form_Windows_Main
                                           .AddObject(
                                                      Loading.Pai(Form_Windows_Main)
                                                       .Loading
                                                         .Mensagem('Aguarde... Apagando tarefa!')
                                                         .AcaoLimpa(
                                                                    procedure ()
                                                                    begin
                                                                      Loading := nil;
                                                                    end
                                                                   )
                                                         .Exibe
                                                     );
                                         End,
                                         procedure ()
                                         Begin
                                          TControllerFactory
                                           .New
                                            .Tarefas
                                             .id(Fid)
                                              .DeletarTarefa(erro);
                                          FMensagem := tpmTasks_Apagada;
                                         End,
                                         procedure ()
                                         Begin
                                          Loading.Loading.Fechar;
                                          if erro = '' then
                                           begin
                                            Dialogs := TViewDialogsMessages.New;
                                            Form_Windows_Main
                                             .AddObject(
                                                        Dialogs.Pai(Form_Windows_Main)
                                                         .DialogMessages
                                                          .TipoMensagem(FMensagem)
                                                          .AcaoBotao(
                                                                     Procedure ()
                                                                     begin
                                                                      Dialogs := nil;
                                                                      if FMain = true then
                                                                       FBtnVoltarClick
                                                                      else
                                                                       begin
                                                                        TabTarefas.GotoVisibleTab(TabListaTarefa.Index);
                                                                        ListarTarefas(Label_Data.Text);
                                                                       end;
                                                                     end
                                                                    )
                                                          .AcaoFundo(
                                                                     Procedure ()
                                                                     begin
                                                                      Dialogs := nil;
                                                                      if FMain = true then
                                                                       FBtnVoltarClick
                                                                      else
                                                                       begin
                                                                        TabTarefas.GotoVisibleTab(TabListaTarefa.Index);
                                                                        ListarTarefas(Label_Data.Text);
                                                                       end;
                                                                     end
                                                                    )
                                                          .Exibe
                                                       );
                                           end;
                                         End
                                        );
                        end
                       )
                .BtnNo(
                       procedure ()
                       begin
                        Dialogs := nil;
                       end
                      )
                .Fundo(
                       procedure ()
                       begin
                        Dialogs := nil;
                       end
                      )
                .Exibe
            );
end;

procedure TWindows_tasks.Btn_Avanca_dataClick(Sender: TObject);
begin
  ListarTarefas(DateToStr(StrToDate(Label_Data.Text) + 1));
end;

procedure TWindows_tasks.Btn_categoriaClick(Sender: TObject);
begin
  Rect_abrir_categorias.Width := Lay_main.Width + 45;
  Rect_abrir_categorias.Height := Lay_main.Height;
  Rect_abrir_categorias.Position.X := - (Rect_abrir_categorias.Width);
  AbreTelaCategorias;
end;

procedure TWindows_tasks.Btn_dataClick(Sender: TObject);
begin
  FCalendar := TViewDialogsMessages.New;
  FData := DateToStr(now);
  Form_Windows_Main.AddObject(
                               FCalendar.Pai(Form_Windows_Main)
                                        .Calendar
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

procedure TWindows_tasks.Btn_edita_taskClick(Sender: TObject);
begin
  FModo := mEditar;
  EditarTarefa(FMain);
end;

procedure TWindows_tasks.Btn_OKClick(Sender: TObject);
Var
 Erro      : string;
 FMensagem : tTipoMensagem;
begin
  if Ed_descricao.Lines.Text <> 'Digite aqui uma descrição para a tarefa' then
   FDescricao := Ed_descricao.Lines.Text;
  teTasksLibrary.CustomThread(
                              Procedure ()
                              var
                               msg : string;
                              begin
                                Loading := TViewDialogsMessages.New;
                                case Fmodo of
                                  mEditar:  msg := 'Aguarde... Salvando modificações!';
                                  mInserir: msg := 'Aguarde... Salvando nova tarefa!';
                                end;
                                Form_Windows_Main.AddObject(
                                                       Loading.Pai(Form_Windows_Main)
                                                        .Loading
                                                         .Mensagem(msg)
                                                         .AcaoLimpa(
                                                                    Procedure()
                                                                    begin
                                                                     Loading := nil;
                                                                    end
                                                                   )
                                                         .Exibe
                                                      );
                              end,
                              Procedure ()
                              begin
                                case FModo of
                                  mEditar:
                                   begin
                                     TControllerFactory
                                       .New
                                         .Tarefas
                                           .id(Fid)
                                           .tarefa(FTarefa)
                                           .descricao(FDescricao)
                                           .data(Fdata)
                                           .cat_id(Fcat_id)
                                           .categoria(FCategoria)
                                           .Cat_icon(Fcat_icon)
                                           .Status(Fstatus)
                                           .EditarTarefa(erro);
                                     FMensagem := tpmTasks_Editada;
                                   end;
                                  mInserir:
                                   begin
                                     TControllerFactory
                                       .New
                                         .Tarefas
                                           .id(Fid)
                                           .tarefa(FTarefa)
                                           .descricao(FDescricao)
                                           .data(Fdata)
                                           .cat_id(Fcat_id)
                                           .categoria(FCategoria)
                                           .Cat_icon(Fcat_icon)
                                           .Status(Fstatus)
                                           .NovaTarefa(erro);
                                     FMensagem := tpmTasks_Inserida;
                                   end;
                                end;
                              end,
                              Procedure ()
                              begin
                                Loading.Loading.Fechar;
                                if Erro = '' then
                                 begin
                                   Dialogs := TViewDialogsMessages.New;
                                   Form_Windows_Main
                                     .AddObject(
                                                Dialogs.Pai(Form_Windows_Main)
                                                 .DialogMessages
                                                   .TipoMensagem(FMensagem)
                                                   .AcaoBotao(
                                                              Procedure ()
                                                              begin
                                                                Dialogs := nil;
                                                                ValidaTarefa.Enabled := false;
                                                                if (FMain = true) and (FModo = mInserir) then
                                                                  FBtnVoltarClick;
                                                                if (FMain = true) and (FModo = mEditar) then
                                                                 begin
                                                                  ExibeTarefa(false);
                                                                 end;
                                                                if (FMain = False) and (FModo = mInserir) then
                                                                  begin
                                                                    TabTarefas.GotoVisibleTab(TabListaTarefa.Index);
                                                                    ListarTarefas(Label_Data.Text);
                                                                  end;
                                                                if (FMain = False) and (FModo = mEditar) then
                                                                  begin
                                                                   ExibeTarefa(False);
                                                                  end;
                                                              end
                                                             )
                                                   .AcaoFundo(
                                                              Procedure ()
                                                              begin
                                                                Dialogs := nil;
                                                                ValidaTarefa.Enabled := false;
                                                                if (FMain = true) and (FModo = mInserir) then
                                                                  FBtnVoltarClick;
                                                                if (FMain = true) and (FModo = mEditar) then
                                                                 begin
                                                                  ExibeTarefa(false);
                                                                 end;
                                                                if (FMain = False) and (FModo = mInserir) then
                                                                  begin
                                                                    TabTarefas.GotoVisibleTab(TabListaTarefa.Index);
                                                                    ListarTarefas(Label_Data.Text);
                                                                  end;
                                                                if (FMain = False) and (FModo = mEditar) then
                                                                  begin
                                                                   ExibeTarefa(False);
                                                                  end;
                                                              end
                                                             )
                                                   .Exibe
                                               );
                                 end;

                              end
                             );
end;

procedure TWindows_tasks.Btn_statusClick(Sender: TObject);
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

procedure TWindows_tasks.Btn_Volta_dataClick(Sender: TObject);
begin
   ListarTarefas(DateToStr(StrToDate(Label_Data.Text) - 1));
end;

procedure TWindows_tasks.EditarTarefa(Main: Boolean);
begin
  TabTarefas.GotoVisibleTab(TabNovoEditaTarefa.Index);

  ValidaTarefa.Enabled        := true;
  title_MinhasTarefas.Visible := False;
  title_EditaTarefa.Visible   := True;
  title_NovaTarefa.Visible    := False;

  Edit_tarefa.Text          := FTarefa;
  if FDescricao <> '' then
   begin
    Ed_descricao.Lines.Clear;
    Ed_descricao.FontColor := $FF000000;
    Ed_descricao.Lines.Add(FDescricao);
   end
  else
   begin
     Ed_descricao.FontColor := $FF686868;
     Ed_descricao.Lines.Text := 'Digite aqui uma descrição para a tarefa';
   end;
  Img_categoria_btn.Visible := true;
  Img_categoria_btn.Bitmap  := Img_Categoria_exibe.Bitmap;
  Label_categoria_btn.Text  := FCategoria;
  Label_data_btn.Text       := Label_data_exibe.Text;

end;

procedure TWindows_tasks.Ed_descricaoEnter(Sender: TObject);
begin
  if Ed_descricao.Lines.Text = 'Digite aqui uma descrição para a tarefa' then
   begin
     Ed_descricao.FontColor := $FF000000;
     Ed_descricao.Lines.Clear;
   end;
end;

procedure TWindows_tasks.Ed_descricaoExit(Sender: TObject);
begin
  if Ed_descricao.Lines.Text = '' then
   begin
     Ed_descricao.FontColor := $FF686868;
     Ed_descricao.Lines.Text := 'Digite aqui uma descrição para a tarefa';
     FDescricao := '';
   end
  else
   FDescricao := Ed_descricao.Lines.Text;
end;

procedure TWindows_tasks.ExibeTarefa(Main: Boolean);
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

function TWindows_tasks.Exibir: TLayout;
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
  Result := Lay_main;
end;

procedure TWindows_tasks.ID(value: string);
begin
  Fid := value;
end;

procedure TWindows_tasks.Label_DataClick(Sender: TObject);
begin
  FCalendar := TViewDialogsMessages.New;
  Form_Windows_Main.AddObject(
                          FCalendar.Pai(Form_Windows_Main)
                                         .Calendar
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

procedure TWindows_tasks.Lay_mainResize(Sender: TObject);
begin
   Rect_abrir_categorias.Width := Lay_main.Width + 45;
   Rect_abrir_categorias.Height := Lay_main.Height-2;
   Rect_abrir_categorias.Position.Y := 1;
   AnimaTelaCategorias.StartValue := - (Rect_abrir_categorias.Width + 5);
   if Rect_abrir_categorias.Position.X <> 0 then
    Rect_abrir_categorias.Position.x := - (Rect_abrir_categorias.Width + 5);
end;

procedure TWindows_tasks.ListarTarefas(Data: string);
begin
  Label_Data.Text := Data;
  AtualizaListaTarefas(data);
end;

procedure TWindows_tasks.ListaTarefasItemClickEx(const Sender: TObject;
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
         end
        else
         begin
          Fid := TListView(sender).Items[ItemIndex].TagString;
          FMain := False;
          ExibeTarefa(false);
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

procedure TWindows_tasks.NovaTarefa(Main: Boolean);
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

end.
