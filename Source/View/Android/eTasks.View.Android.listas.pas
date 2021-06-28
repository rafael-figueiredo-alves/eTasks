unit eTasks.View.Android.listas;

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
  FMX.StdCtrls,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Edit,
  FMX.EditBox,
  FMX.NumberBox,
  FMX.Effects,
  FMX.ListBox,
  FMX.SearchBox,
  FMX.MultiView,
  eTasks.View.Dialogs.Factory;

type

  Modos = (mNovo, mEditar);

  Tandroid_listas = class(TForm)
    Lay_main: TLayout;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasListas: TImage;
    title_EditaItemLista: TImage;
    title_NovoItemLista: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    TabListas: TTabControl;
    TabListasListagem: TTabItem;
    TabListasEditaNovo: TTabItem;
    Btn_Add_Meta: TImage;
    Seta_Sem_Itens: TImage;
    Lay_Topo_lista: TLayout;
    Lay_data_select: TLayout;
    Btn_Volta_data: TImage;
    Btn_Avanca_data: TImage;
    Label_Data: TLabel;
    ListaMercado: TListView;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_Metas: TImage;
    Img_item_comprado: TImage;
    Img_item_comprar: TImage;
    Btn_apaga_Item: TImage;
    Btn_OK: TImage;
    Lay_Quantidade_edit: TLayout;
    Linha_quantidade_edit: TLine;
    Label_quantidade_edit: TLabel;
    Lay_unidade_edit: TLayout;
    Linha_unidade: TLine;
    Label_unidade_edit: TLabel;
    Lay_quantidade_box: TLayout;
    Diminuir_quantidade: TImage;
    Aumentar_quantidade: TImage;
    Ed_quantidade: TNumberBox;
    StyleBook1: TStyleBook;
    Lay_unidade_box: TLayout;
    Btn_popup_unidade: TImage;
    Edit_Unidade: TEdit;
    Lay_meta: TLayout;
    Lay_tarefa_container: TLayout;
    Rec_tarefa: TRectangle;
    ShadowEffect1: TShadowEffect;
    Img_tarefa: TImage;
    Edit_Produto: TEdit;
    ListaDeProdutos: TListBox;
    SearchBox1: TSearchBox;
    Unidade_popup: TMultiView;
    Lay_popup_quilos: TLayout;
    Image_quilos: TImage;
    Label_quilos: TLabel;
    Lay_popup_gramas: TLayout;
    Image_gramas: TImage;
    Label2: TLabel;
    Lay_popup_caixas: TLayout;
    Image_caixas: TImage;
    Label_caixas: TLabel;
    Lay_popup_litros: TLayout;
    Image_litros: TImage;
    Label_litros: TLabel;
    Lay_popup_pote: TLayout;
    Image_potes: TImage;
    Label_potes: TLabel;
    Lay_popup_pacote: TLayout;
    Image_pacote: TImage;
    Label_pacote: TLabel;
    Lay_popup_caixinha: TLayout;
    Image_caixinha: TImage;
    Label_caixinha: TLabel;
    Lay_popup_garrafa: TLayout;
    Image_garrafa: TImage;
    Label_garrafa: TLabel;
    Lay_popup_unidade: TLayout;
    Image_unidade: TImage;
    Label_unidade: TLabel;
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabListasChange(Sender: TObject);
    procedure Btn_Add_MetaClick(Sender: TObject);
    procedure ListaDeProdutosItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure Edit_ProdutoTyping(Sender: TObject);
    procedure Aumentar_quantidadeClick(Sender: TObject);
    procedure Diminuir_quantidadeClick(Sender: TObject);
    procedure Lay_popup_quilosClick(Sender: TObject);
    procedure Lay_popup_gramasClick(Sender: TObject);
    procedure Lay_popup_unidadeClick(Sender: TObject);
    procedure Lay_popup_garrafaClick(Sender: TObject);
    procedure Lay_popup_caixinhaClick(Sender: TObject);
    procedure Lay_popup_pacoteClick(Sender: TObject);
    procedure Lay_popup_poteClick(Sender: TObject);
    procedure Lay_popup_litrosClick(Sender: TObject);
    procedure Lay_popup_caixasClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Btn_Volta_dataClick(Sender: TObject);
    procedure Btn_Avanca_dataClick(Sender: TObject);
    procedure Label_DataClick(Sender: TObject);
    procedure ListaMercadoItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Btn_apaga_ItemClick(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
  private
    { Private declarations }
    FId: string;
    FItem: string;
    FQuantidade: string;
    FUnidade: string;
    FStatus: string;
    FData: string;
    FModo: Modos;
    Dialogs: iViewDialogsFactory;
    Loading: iViewDialogsFactory;
    FCalendar: iViewDialogsFactory;
    Procedure ListarItens(Data: string);
    Procedure AddItemLista(Id, Item, Quantidade, Unidade, Status: string);
    Procedure NovoItem;
    Procedure EditaItem;
    Procedure ApagaItem;
    Procedure SalvaItem;
    procedure MontaListaProdutos;
  public
    { Public declarations }
  end;

var
  android_listas: Tandroid_listas;

implementation

{$R *.fmx}

Uses
  FMX.VirtualKeyboard,
  FMX.platform,
  eTasks.Controller.Interfaces,
  eTasks.libraries,
  eTasks.Controller.Factory,
  eTasks.View.Dialogs.Messages.Consts;

procedure Tandroid_listas.AddItemLista(Id, Item, Quantidade, Unidade,
  Status: string);
begin
  with ListaMercado.Items.Add do
  begin
    TListItemText(Objects.FindDrawable('Produto')).Text := Item;

    TListItemText(Objects.FindDrawable('Quantidade')).Text := Quantidade;

    TListItemText(Objects.FindDrawable('Unidade')).Text := Unidade;

    if Status = 'Comprar' then
    begin
      TListItemImage(Objects.FindDrawable('Img_Status')).Bitmap :=
        Img_item_comprar.Bitmap;
      TListItemImage(Objects.FindDrawable('Img_Status')).TagString := 'Comprar';
    end
    else
    begin
      TListItemImage(Objects.FindDrawable('Img_Status')).Bitmap :=
        Img_item_comprado.Bitmap;
      TListItemImage(Objects.FindDrawable('Img_Status')).TagString :=
        'Comprado';
    end;

    TagString := Id;
  end;
end;

procedure Tandroid_listas.AnimaStatusFinish(Sender: TObject);
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

procedure Tandroid_listas.ApagaItem;
Var
 erro      : string;
 FMensagem : tTipoMensagem;
begin
 Dialogs := TViewDialogsMessages.New;
 Android_listas
  .AddObject(
             Dialogs
              .DialogYesNo
                .Messagem('Tem certeza que deseja apagar este item da lista?')
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
                                          Android_listas
                                           .AddObject(
                                                      Loading
                                                       .Loading
                                                         .Mensagem('Aguarde... Apagando item da lista!')
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
                                            .ItemLista
                                             .data(FData)
                                             .id(Fid)
                                              .DeletaItem(erro);
                                          FMensagem := tpmGoals_Apagada;
                                         End,
                                         procedure ()
                                         Begin
                                          Loading.Loading.Fechar;
                                          if erro = '' then
                                           begin
                                            Dialogs := TViewDialogsMessages.New;
                                            Android_Listas
                                             .AddObject(
                                                        Dialogs
                                                         .DialogMessages
                                                          .TipoMensagem(FMensagem)
                                                          .AcaoBotao(
                                                                     Procedure ()
                                                                     begin
                                                                      Dialogs := nil;
                                                                      TabListas.GotoVisibleTab(TabListasListagem.Index);
                                                                      ListarItens(FData);
                                                                     end
                                                                    )
                                                          .AcaoFundo(
                                                                     Procedure ()
                                                                     begin
                                                                      Dialogs := nil;
                                                                      TabListas.GotoVisibleTab(TabListasListagem.Index);
                                                                      ListarItens(FData);
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

procedure Tandroid_listas.Aumentar_quantidadeClick(Sender: TObject);
begin
  Ed_quantidade.ValueInc;
end;

procedure Tandroid_listas.Botao_voltarClick(Sender: TObject);
begin
  if TabListas.ActiveTab <> TabListasListagem then
    TabListas.GotoVisibleTab(TabListasListagem.Index)
  else
    AnimaStatus.Start;
end;

procedure Tandroid_listas.Btn_Add_MetaClick(Sender: TObject);
begin
  NovoItem;
end;

procedure Tandroid_listas.Btn_apaga_ItemClick(Sender: TObject);
begin
  ApagaItem;
end;

procedure Tandroid_listas.Btn_Avanca_dataClick(Sender: TObject);
begin
  ListarItens(DateToStr(StrToDate(Label_Data.Text) + 1));
end;

procedure Tandroid_listas.Btn_OKClick(Sender: TObject);
begin
  FItem := Edit_Produto.Text;
  FQuantidade := Ed_quantidade.Value.ToString;
  FUnidade    := Edit_Unidade.Text;
  SalvaItem;
end;

procedure Tandroid_listas.Btn_Volta_dataClick(Sender: TObject);
begin
  ListarItens(DateToStr(StrToDate(Label_Data.Text) - 1));
end;

procedure Tandroid_listas.Diminuir_quantidadeClick(Sender: TObject);
begin
  Ed_quantidade.ValueDec;
end;

procedure Tandroid_listas.EditaItem;
begin
 teTasksLibrary.CustomThread(procedure ()
                             begin
                                FModo := mEditar;
                                Ed_quantidade.Value := FQuantidade.ToSingle;
                                Edit_Unidade.Text := FUnidade;
                                Edit_Produto.Text := FItem;
                                FData := Label_Data.Text;
                                Btn_apaga_Item.Visible := true;
                                TabListas.GotoVisibleTab(TabListasEditaNovo.Index);
                             end,
                             Procedure ()
                             Begin
                              MontaListaProdutos;
                             End,
                            Procedure ()
                            Begin

                            End
                            );
end;

procedure Tandroid_listas.Edit_ProdutoTyping(Sender: TObject);
begin
  SearchBox1.Text := Edit_Produto.Text;
end;

procedure Tandroid_listas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  android_listas := nil;
end;

procedure Tandroid_listas.FormKeyUp(Sender: TObject; var Key: Word;
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
      if (Assigned(Dialogs)) or (Assigned(Loading)) or (Assigned(FCalendar)) or
        (Unidade_popup.IsShowed) then
      begin
        Key := 0;
        if Assigned(Dialogs) then
        begin
          Dialogs.DialogMessages.Fechar;
        end;
        if Assigned(FCalendar) then
        begin
          FCalendar.Calendar.Fechar;
        end;
        if (Unidade_popup.IsShowed) then
          Unidade_popup.HideMaster;
      end
      else
      begin
        Key := 0;
        Botao_voltarClick(Sender);
      end;
    end;
  end;
end;

procedure Tandroid_listas.FormShow(Sender: TObject);
begin
  ListarItens(DateToStr(now));
  AnimaStatus.Start;
end;

procedure Tandroid_listas.Label_DataClick(Sender: TObject);
Var
  FService: iFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(iFMXVirtualKeyboardService,
    IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible
    in FService.VirtualKeyboardState) then
  begin
    FService.HideVirtualKeyboard;
  end;
  FCalendar := TViewDialogsMessages.New;
  android_listas.AddObject(FCalendar.Calendar.Data(StrToDate(Label_Data.Text))
    .AcaoBotao(
    Procedure()
    begin
      ListarItens(DateToStr(FCalendar.Calendar.Data));
      FCalendar := nil;
    end).AcaoFundo(
    Procedure()
    begin
      FCalendar := nil;
    end).Exibe);
end;

procedure Tandroid_listas.Lay_popup_caixasClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Caixas';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.Lay_popup_caixinhaClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Caixinhas';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.Lay_popup_garrafaClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Garrafas';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.Lay_popup_gramasClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Gramas';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.Lay_popup_litrosClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Litros';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.Lay_popup_pacoteClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Pacotes';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.Lay_popup_poteClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Potes';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.Lay_popup_quilosClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Quilos';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.Lay_popup_unidadeClick(Sender: TObject);
begin
  Edit_Unidade.Text := 'Unidades';
  Unidade_popup.HideMaster;
end;

procedure Tandroid_listas.ListarItens(Data: string);
Var
  erro: string;
  Lista: iControllerItemLista;
begin
  Label_Data.Text := Data;
  FData := Data;
  teTasksLibrary.CustomThread(
    Procedure()
    begin
      Loading := TViewDialogsMessages.New;
      android_listas.AddObject(Loading.Loading.Mensagem
        ('Buscando sua Lista. Aguarde, por favor... ').AcaoLimpa(
        Procedure()
        begin
          Loading := nil;
        end).Exibe);
    end,
    Procedure()
    begin
      Lista := tcontrollerfactory.New.ItemLista.Data(FData)
        .ListarItemsLista(erro);
    end,
    Procedure()
    Var
      ItemLista: TItemLista;
    begin
      Loading.Loading.Fechar;
      if erro = '' then
      begin
        ListaMercado.Items.Clear;
        Lay_Lista_vazia.Visible := False;
        Seta_Sem_Itens.Visible := False;
        if Lista.ListagemItems.Count <> 0 then
        begin
          ListaMercado.BeginUpdate;
          for ItemLista in Lista.ListagemItems.Values do
            AddItemLista(ItemLista.Id, ItemLista.Item, ItemLista.Quantidade,
              ItemLista.Unidade, ItemLista.Status);
          ListaMercado.EndUpdate;
        end
        else
        begin
          Lay_Lista_vazia.Visible := true;
          Seta_Sem_Itens.Visible := true;
        end
      end
      else
      begin
        if erro = 'vazio' then
        Begin
          ListaMercado.Items.Clear;
          Lay_Lista_vazia.Visible := true;
          Seta_Sem_Itens.Visible := true;
        End;
      end;
    end);
end;

procedure Tandroid_listas.MontaListaProdutos;
begin
  ListaDeProdutos.BeginUpdate;
  ListaDeProdutos.Items.Add('Abacaxi');
  ListaDeProdutos.Items.Add('Absorventes');
  ListaDeProdutos.Items.Add('Acelga');
  ListaDeProdutos.Items.Add('Alcatara');
  ListaDeProdutos.Items.Add('Alface');
  ListaDeProdutos.Items.Add('Algodão');
  ListaDeProdutos.Items.Add('Amaciante');
  ListaDeProdutos.Items.Add('Amendoim');
  ListaDeProdutos.Items.Add('Arroz');
  ListaDeProdutos.Items.Add('Atemoia');
  ListaDeProdutos.Items.Add('Azeite');
  ListaDeProdutos.Items.Add('Azeitona');
  ListaDeProdutos.Items.Add('Açúcar');
  ListaDeProdutos.Items.Add('Baguete');
  ListaDeProdutos.Items.Add('Banana');
  ListaDeProdutos.Items.Add('Barbeador descartável');
  ListaDeProdutos.Items.Add('Batata Asterix');
  ListaDeProdutos.Items.Add('Batata Monalisa');
  ListaDeProdutos.Items.Add('Biscoitos');
  ListaDeProdutos.Items.Add('Bisteca');
  ListaDeProdutos.Items.Add('Bolacha doce');
  ListaDeProdutos.Items.Add('Bolacha salgada');
  ListaDeProdutos.Items.Add('Café');
  ListaDeProdutos.Items.Add('Carnes');
  ListaDeProdutos.Items.Add('Cereal');
  ListaDeProdutos.Items.Add('Condicionador');
  ListaDeProdutos.Items.Add('Contra-filé');
  ListaDeProdutos.Items.Add('Coxa e sobrecoxa');
  ListaDeProdutos.Items.Add('Coxinha da Asa');
  ListaDeProdutos.Items.Add('Coxinhas');
  ListaDeProdutos.Items.Add('Creme dental');
  ListaDeProdutos.Items.Add('Curativos');
  ListaDeProdutos.Items.Add('Cuzcuz');
  ListaDeProdutos.Items.Add('Desinfetante');
  ListaDeProdutos.Items.Add('Desodorante');
  ListaDeProdutos.Items.Add('Detergente');
  ListaDeProdutos.Items.Add('Escova de dente');
  ListaDeProdutos.Items.Add('Esparadrapo');
  ListaDeProdutos.Items.Add('Esponja de aço');
  ListaDeProdutos.Items.Add('Esponja de pia');
  ListaDeProdutos.Items.Add('Farinha');
  ListaDeProdutos.Items.Add('Farinha de rosca');
  ListaDeProdutos.Items.Add('Feijão');
  ListaDeProdutos.Items.Add('Fermento');
  ListaDeProdutos.Items.Add('Fermento biológico');
  ListaDeProdutos.Items.Add('Fermento em pó');
  ListaDeProdutos.Items.Add('Filé de merluza');
  ListaDeProdutos.Items.Add('Fio dental');
  ListaDeProdutos.Items.Add('Flanelas');
  ListaDeProdutos.Items.Add('Frango assado');
  ListaDeProdutos.Items.Add('Fígado');
  ListaDeProdutos.Items.Add('Fósforo');
  ListaDeProdutos.Items.Add('Gaze');
  ListaDeProdutos.Items.Add('Gelatina');
  ListaDeProdutos.Items.Add('Guardanapo de papel');
  ListaDeProdutos.Items.Add('Hastes flexíveis');
  ListaDeProdutos.Items.Add('Hortaliças');
  ListaDeProdutos.Items.Add('Inseticida');
  ListaDeProdutos.Items.Add('Iogurte');
  ListaDeProdutos.Items.Add('Ketchup');
  ListaDeProdutos.Items.Add('Laranja');
  ListaDeProdutos.Items.Add('Leite');
  ListaDeProdutos.Items.Add('Linguiça Calabresa');
  ListaDeProdutos.Items.Add('Linguiça Toscana');
  ListaDeProdutos.Items.Add('Lustra-móveis');
  ListaDeProdutos.Items.Add('Luvas plásticas');
  ListaDeProdutos.Items.Add('Lâmpadas');
  ListaDeProdutos.Items.Add('Macarrão');
  ListaDeProdutos.Items.Add('Maionese');
  ListaDeProdutos.Items.Add('Maminha');
  ListaDeProdutos.Items.Add('Manteiga');
  ListaDeProdutos.Items.Add('Margarina');
  ListaDeProdutos.Items.Add('Massa de cuzcuz');
  ListaDeProdutos.Items.Add('Massa de tapioca');
  ListaDeProdutos.Items.Add('Massa para pizza');
  ListaDeProdutos.Items.Add('Maçã');
  ListaDeProdutos.Items.Add('Melância');
  ListaDeProdutos.Items.Add('Melão');
  ListaDeProdutos.Items.Add('Mexerica');
  ListaDeProdutos.Items.Add('Miojo');
  ListaDeProdutos.Items.Add('Moela');
  ListaDeProdutos.Items.Add('Molho de tomate');
  ListaDeProdutos.Items.Add('Mortadela');
  ListaDeProdutos.Items.Add('Mostarda');
  ListaDeProdutos.Items.Add('Nescau');
  ListaDeProdutos.Items.Add('Ovos');
  ListaDeProdutos.Items.Add('Papel Alumínio');
  ListaDeProdutos.Items.Add('Papel Filme');
  ListaDeProdutos.Items.Add('Papel higiênico');
  ListaDeProdutos.Items.Add('Papel toalha');
  ListaDeProdutos.Items.Add('Peito de frango');
  ListaDeProdutos.Items.Add('Pera');
  ListaDeProdutos.Items.Add('Picanha');
  ListaDeProdutos.Items.Add('Pizza');
  ListaDeProdutos.Items.Add('Presunto');
  ListaDeProdutos.Items.Add('Pães');
  ListaDeProdutos.Items.Add('Pão de queijo');
  ListaDeProdutos.Items.Add('Pé de frango');
  ListaDeProdutos.Items.Add('Queijo');
  ListaDeProdutos.Items.Add('Queijo chedar');
  ListaDeProdutos.Items.Add('Queijo Fresco');
  ListaDeProdutos.Items.Add('Queijo ralado');
  ListaDeProdutos.Items.Add('Repolho');
  ListaDeProdutos.Items.Add('Sabonete');
  ListaDeProdutos.Items.Add('Sabão em barra');
  ListaDeProdutos.Items.Add('Sabão em pó');
  ListaDeProdutos.Items.Add('Sacos de lixo');
  ListaDeProdutos.Items.Add('Sal');
  ListaDeProdutos.Items.Add('Salgadinhos');
  ListaDeProdutos.Items.Add('Salsicha');
  ListaDeProdutos.Items.Add('Sardinha');
  ListaDeProdutos.Items.Add('Shampoo');
  ListaDeProdutos.Items.Add('Tapioca');
  ListaDeProdutos.Items.Add('Temperos');
  ListaDeProdutos.Items.Add('Tilápia');
  ListaDeProdutos.Items.Add('Toddy');
  ListaDeProdutos.Items.Add('Tomate');
  ListaDeProdutos.Items.Add('Uva');
  ListaDeProdutos.Items.Add('Água oxigenada');
  ListaDeProdutos.Items.Add('Água Sanitária');
  ListaDeProdutos.Items.Add('Álcool em gel');
  ListaDeProdutos.Items.Add('Óleo');
  ListaDeProdutos.EndUpdate;
end;

procedure Tandroid_listas.NovoItem;
begin
 teTasksLibrary.CustomThread(Procedure ()
                             begin
                               FModo := mNovo;
                               Ed_quantidade.Value := 0;
                               Edit_Unidade.Text := 'Quilos';
                               Edit_Produto.Text := '';
                               SearchBox1.Text := '';
                               FData := Label_Data.Text;
                               FItem := '';
                               FQuantidade := '';
                               FUnidade := '';
                               FStatus := 'Comprar';
                               Btn_apaga_Item.Visible := false;
                               TabListas.GotoVisibleTab(TabListasEditaNovo.Index);
                             end,
                             Procedure ()
                             begin
                              MontaListaProdutos;
                             end,
                             Procedure()
                             begin

                             end
                            );
end;

procedure Tandroid_listas.SalvaItem;
Var
 Erro      : string;
 FMensagem : tTipoMensagem;
begin
  teTasksLibrary.CustomThread(
                              Procedure ()
                              var
                               msg : string;
                              begin
                                Loading := TViewDialogsMessages.New;
                                case Fmodo of
                                  mEditar:  msg := 'Aguarde... Salvando modificações!';
                                  mNovo: msg := 'Aguarde... Salvando novo item da lista!';
                                end;
                                Android_listas.AddObject(
                                                       Loading
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
                                         .ItemLista
                                           .id(Fid)
                                           .data(FData)
                                           .item(FItem)
                                           .Quantidade(FQuantidade)
                                           .unidade(FUnidade)
                                           .Status(FStatus)
                                           .EditaItem(erro);
                                     FMensagem := tpmGoals_Editada; //trocar mensagem
                                   end;
                                  mNovo:
                                   begin
                                     TControllerFactory
                                       .New
                                         .ItemLista
                                           .data(FData)
                                           .item(FItem)
                                           .Quantidade(FQuantidade)
                                           .unidade(FUnidade)
                                           .Status(FStatus)
                                           .NovoItem(erro);
                                     FMensagem := tpmGoals_Inserida;  //trocar mensagem
                                   end;
                                end;
                              end,
                              Procedure ()
                              begin
                                Loading.Loading.Fechar;
                                if Erro = '' then
                                 begin
                                   Dialogs := TViewDialogsMessages.New;
                                   Android_listas
                                     .AddObject(
                                                Dialogs
                                                 .DialogMessages
                                                   .TipoMensagem(FMensagem)
                                                   .AcaoBotao(
                                                              Procedure ()
                                                              begin
                                                                Dialogs := nil;
                                                                //ValidaMeta.Enabled := false;
                                                                TabListas.GotoVisibleTab(TabListasListagem.Index);
                                                                ListarItens(FData);
                                                              end
                                                             )
                                                   .AcaoFundo(
                                                              Procedure ()
                                                              begin
                                                                Dialogs := nil;
                                                                //ValidaMeta.Enabled := false;
                                                                //ValidaMeta.Enabled := false;
                                                                TabListas.GotoVisibleTab(TabListasListagem.Index);
                                                                ListarItens(FData);
                                                              end
                                                             )
                                                   .Exibe
                                               );
                                 end;

                              end
                             );
end;

procedure Tandroid_listas.ListaDeProdutosItemClick(const Sender: TCustomListBox;
const Item: TListBoxItem);
begin
  Edit_Produto.Text := Item.Text;
end;

procedure Tandroid_listas.ListaMercadoItemClickEx(const Sender: TObject;
ItemIndex: Integer; const LocalClickPos: TPointF;
const ItemObject: TListItemDrawable);
{ Var
  ErroStatus : string; }
begin
  if TListView(Sender).Selected <> nil then
  begin
    if ItemObject is TListItemImage then
    begin
      if ItemObject.Name = 'Img_Status' then
      begin
        if ItemObject.TagString = 'Comprar' then
        begin
          { TControllerFactory.New.Tarefas
            .id(TListView(sender).Items[ItemIndex].TagString)
            .Status('concluido')
            .MudaStatus(ErroStatus);
            if ErroStatus = '' then
            begin }
          TListItemImage(ItemObject).Bitmap := Img_item_comprado.Bitmap;
          ItemObject.TagString := 'Comprado';
          // end;
        end
        else
        begin
          { TControllerFactory.New.Tarefas
            .id(TListView(sender).Items[ItemIndex].TagString)
            .Status('fazer')
            .MudaStatus(ErroStatus);
            if ErroStatus = '' then
            begin }
          TListItemImage(ItemObject).Bitmap := Img_item_comprar.Bitmap;
          ItemObject.TagString := 'Comprar';
          // end;
        end;
      end
      else
      begin
        FId := TListView(Sender).Items[ItemIndex].TagString;
        FStatus := TListItemImage(ListaMercado.Items[ItemIndex]
          .View.FindDrawable('Img_Status')).TagString;
        FItem := TListItemText(ListaMercado.Items[ItemIndex].View.FindDrawable
          ('Produto')).Text;
        FQuantidade := TListItemText(ListaMercado.Items[ItemIndex]
          .View.FindDrawable('Quantidade')).Text;
        FUnidade := TListItemText(ListaMercado.Items[ItemIndex]
          .View.FindDrawable('Unidade')).Text;
        EditaItem;
      end;
    end
    else
    begin
      FId := TListView(Sender).Items[ItemIndex].TagString;
      FStatus := TListItemImage(ListaMercado.Items[ItemIndex].View.FindDrawable
        ('Img_Status')).TagString;
      FItem := TListItemText(ListaMercado.Items[ItemIndex].View.FindDrawable
        ('Produto')).Text;
      FQuantidade := TListItemText(ListaMercado.Items[ItemIndex]
        .View.FindDrawable('Quantidade')).Text;
      FUnidade := TListItemText(ListaMercado.Items[ItemIndex].View.FindDrawable
        ('Unidade')).Text;
      EditaItem;
    end;

  end;
end;

procedure Tandroid_listas.TabListasChange(Sender: TObject);
begin
  case TabListas.ActiveTab.Index of
    0:
      begin
        title_MinhasListas.Visible := true;
        title_EditaItemLista.Visible := False;
        title_NovoItemLista.Visible := False;
      end;
    1:
      begin
        title_MinhasListas.Visible := False;
        case FModo of
          mNovo:
            begin
              title_NovoItemLista.Visible := true;
              title_EditaItemLista.Visible := False;
            end;
          mEditar:
            begin
              title_NovoItemLista.Visible := False;
              title_EditaItemLista.Visible := true;
            end;
        end;
      end;
  end;
end;

end.
