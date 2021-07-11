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
    ListaDeProdutos: TListView;
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabListasChange(Sender: TObject);
    procedure Btn_Add_MetaClick(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
    procedure ListaDeProdutosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Edit_ProdutoTyping(Sender: TObject);
    procedure ListaMercadoPullRefresh(Sender: TObject);
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
                                          FMensagem := tpmLists_Apagada;
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
                                //ListaDeProdutos.Selected.Index := -1;
                                ListaDeProdutos.ItemIndex := -1;
                                ListaDeProdutos.ScrollTo(0);
                                //MontaListaProdutos;
                             end,
                             Procedure ()
                             Begin

                             End,
                            Procedure ()
                            Begin
                              TabListas.GotoVisibleTab(TabListasEditaNovo.Index);
                            End
                            );
end;

procedure Tandroid_listas.Edit_ProdutoTyping(Sender: TObject);
begin
  if Edit_Produto.Text <> '' then
   ListaDeProdutos.Items.Filter := Function (Pesquisa: string) : Boolean
                                 Var Contador : integer;
                                 begin
                                   Contador := Pos(Edit_Produto.Text.ToUpper, pesquisa.ToUpper);
                                   Result := contador <> 0;
                                 end
  else
   ListaDeProdutos.Items.Filter := Function (Pesquisa: string) : Boolean
                                 Begin
                                   Result := True;
                                 End;
end;

procedure Tandroid_listas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  android_listas := nil;
end;

procedure Tandroid_listas.FormCreate(Sender: TObject);
begin
  MontaListaProdutos;
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
  ListaDeProdutos.Items.Add.text:= 'Abacaxi';
  ListaDeProdutos.Items.Add.text:= 'Absorventes';
  ListaDeProdutos.Items.Add.text:= 'Acelga';
  ListaDeProdutos.Items.Add.text:= 'Alcatara';
  ListaDeProdutos.Items.Add.text:= 'Alface';
  ListaDeProdutos.Items.Add.text:= 'Algodão';
  ListaDeProdutos.Items.Add.text:= 'Amaciante';
  ListaDeProdutos.Items.Add.text:= 'Amendoim';
  ListaDeProdutos.Items.Add.text:= 'Arroz';
  ListaDeProdutos.Items.Add.text:= 'Atemoia';
  ListaDeProdutos.Items.Add.text:= 'Azeite';
  ListaDeProdutos.Items.Add.text:= 'Azeitona';
  ListaDeProdutos.Items.Add.text:= 'Açúcar';
  ListaDeProdutos.Items.Add.text:= 'Baguete';
  ListaDeProdutos.Items.Add.text:= 'Banana';
  ListaDeProdutos.Items.Add.text:= 'Barbeador descartável';
  ListaDeProdutos.Items.Add.text:= 'Batata Asterix';
  ListaDeProdutos.Items.Add.text:= 'Batata Monalisa';
  ListaDeProdutos.Items.Add.Text:= 'Biscoitos';
  ListaDeProdutos.Items.Add.Text:= 'Bisteca';
  ListaDeProdutos.Items.Add.Text:= 'Bolacha doce';
  ListaDeProdutos.Items.Add.Text:= 'Bolacha salgada';
  ListaDeProdutos.Items.Add.Text:= 'Café';
  ListaDeProdutos.Items.Add.Text:= 'Carnes';
  ListaDeProdutos.Items.Add.Text:= 'Cereal';
  ListaDeProdutos.Items.Add.Text:= 'Condicionador';
  ListaDeProdutos.Items.Add.Text:= 'Contra-filé';
  ListaDeProdutos.Items.Add.Text:= 'Coxa e sobrecoxa';
  ListaDeProdutos.Items.Add.Text:= 'Coxinha da Asa';
  ListaDeProdutos.Items.Add.Text:= 'Coxinhas';
  ListaDeProdutos.Items.Add.Text:= 'Creme dental';
  ListaDeProdutos.Items.Add.Text:= 'Curativos';
  ListaDeProdutos.Items.Add.Text:= 'Cuzcuz';
  ListaDeProdutos.Items.Add.Text:= 'Desinfetante';
  ListaDeProdutos.Items.Add.Text:= 'Desodorante';
  ListaDeProdutos.Items.Add.Text:= 'Detergente';
  ListaDeProdutos.Items.Add.Text:= 'Escova de dente';
  ListaDeProdutos.Items.Add.Text:= 'Esparadrapo';
  ListaDeProdutos.Items.Add.Text:= 'Esponja de aço';
  ListaDeProdutos.Items.Add.Text:= 'Esponja de pia';
  ListaDeProdutos.Items.Add.Text:= 'Farinha';
  ListaDeProdutos.Items.Add.Text:= 'Farinha de rosca';
  ListaDeProdutos.Items.Add.Text:= 'Feijão';
  ListaDeProdutos.Items.Add.Text:= 'Fermento';
  ListaDeProdutos.Items.Add.Text:= 'Fermento biológico';
  ListaDeProdutos.Items.Add.Text:= 'Fermento em pó';
  ListaDeProdutos.Items.Add.Text:= 'Filé de merluza';
  ListaDeProdutos.Items.Add.Text:= 'Fio dental';
  ListaDeProdutos.Items.Add.Text:= 'Flanelas';
  ListaDeProdutos.Items.Add.Text:= 'Frango assado';
  ListaDeProdutos.Items.Add.Text:= 'Fígado';
  ListaDeProdutos.Items.Add.Text:= 'Fósforo';
  ListaDeProdutos.Items.Add.Text:= 'Gaze';
  ListaDeProdutos.Items.Add.Text:= 'Gelatina';
  ListaDeProdutos.Items.Add.Text:= 'Guardanapo de papel';
  ListaDeProdutos.Items.Add.Text:= 'Hastes flexíveis';
  ListaDeProdutos.Items.Add.Text:= 'Hortaliças';
  ListaDeProdutos.Items.Add.Text:= 'Inseticida';
  ListaDeProdutos.Items.Add.Text:= 'Iogurte';
  ListaDeProdutos.Items.Add.Text:= 'Ketchup';
  ListaDeProdutos.Items.Add.Text:= 'Laranja';
  ListaDeProdutos.Items.Add.Text:= 'Leite';
  ListaDeProdutos.Items.Add.Text:= 'Linguiça Calabresa';
  ListaDeProdutos.Items.Add.Text:= 'Linguiça Toscana';
  ListaDeProdutos.Items.Add.Text:= 'Lustra-móveis';
  ListaDeProdutos.Items.Add.Text:= 'Luvas plásticas';
  ListaDeProdutos.Items.Add.Text:= 'Lâmpadas';
  ListaDeProdutos.Items.Add.Text:= 'Macarrão';
  ListaDeProdutos.Items.Add.Text:= 'Maionese';
  ListaDeProdutos.Items.Add.Text:= 'Maminha';
  ListaDeProdutos.Items.Add.Text:= 'Manteiga';
  ListaDeProdutos.Items.Add.Text:= 'Margarina';
  ListaDeProdutos.Items.Add.Text:= 'Massa de cuzcuz';
  ListaDeProdutos.Items.Add.Text:= 'Massa de tapioca';
  ListaDeProdutos.Items.Add.Text:= 'Massa para pizza';
  ListaDeProdutos.Items.Add.Text:= 'Maçã';
  ListaDeProdutos.Items.Add.Text:= 'Melância';
  ListaDeProdutos.Items.Add.Text:= 'Melão';
  ListaDeProdutos.Items.Add.Text:= 'Mexerica';
  ListaDeProdutos.Items.Add.Text:= 'Miojo';
  ListaDeProdutos.Items.Add.Text:= 'Moela';
  ListaDeProdutos.Items.Add.Text:= 'Molho de tomate';
  ListaDeProdutos.Items.Add.Text:= 'Mortadela';
  ListaDeProdutos.Items.Add.Text:= 'Mostarda';
  ListaDeProdutos.Items.Add.Text:= 'Nescau';
  ListaDeProdutos.Items.Add.Text:= 'Ovos';
  ListaDeProdutos.Items.Add.Text:= 'Papel Alumínio';
  ListaDeProdutos.Items.Add.Text:= 'Papel Filme';
  ListaDeProdutos.Items.Add.Text:= 'Papel higiênico';
  ListaDeProdutos.Items.Add.Text:= 'Papel toalha';
  ListaDeProdutos.Items.Add.Text:= 'Peito de frango';
  ListaDeProdutos.Items.Add.Text:= 'Pera';
  ListaDeProdutos.Items.Add.Text:= 'Picanha';
  ListaDeProdutos.Items.Add.Text:= 'Pizza';
  ListaDeProdutos.Items.Add.Text:= 'Presunto';
  ListaDeProdutos.Items.Add.Text:= 'Pães';
  ListaDeProdutos.Items.Add.Text:= 'Pão de queijo';
  ListaDeProdutos.Items.Add.Text:= 'Pé de frango';
  ListaDeProdutos.Items.Add.Text:= 'Queijo';
  ListaDeProdutos.Items.Add.Text:= 'Queijo chedar';
  ListaDeProdutos.Items.Add.Text:= 'Queijo Fresco';
  ListaDeProdutos.Items.Add.Text:= 'Queijo ralado';
  ListaDeProdutos.Items.Add.Text:= 'Repolho';
  ListaDeProdutos.Items.Add.Text:= 'Sabonete';
  ListaDeProdutos.Items.Add.Text:= 'Sabão em barra';
  ListaDeProdutos.Items.Add.Text:= 'Sabão em pó';
  ListaDeProdutos.Items.Add.Text:= 'Sacos de lixo';
  ListaDeProdutos.Items.Add.Text:= 'Sal';
  ListaDeProdutos.Items.Add.Text:= 'Salgadinhos';
  ListaDeProdutos.Items.Add.Text:= 'Salsicha';
  ListaDeProdutos.Items.Add.Text:= 'Sardinha';
  ListaDeProdutos.Items.Add.Text:= 'Shampoo';
  ListaDeProdutos.Items.Add.Text:= 'Tapioca';
  ListaDeProdutos.Items.Add.Text:= 'Temperos';
  ListaDeProdutos.Items.Add.Text:= 'Tilápia';
  ListaDeProdutos.Items.Add.Text:= 'Toddy';
  ListaDeProdutos.Items.Add.Text:= 'Tomate';
  ListaDeProdutos.Items.Add.Text:= 'Uva';
  ListaDeProdutos.Items.Add.Text:= 'Água oxigenada';
  ListaDeProdutos.Items.Add.Text:= 'Água Sanitária';
  ListaDeProdutos.Items.Add.Text:= 'Álcool em gel';
  ListaDeProdutos.Items.Add.Text:= 'Óleo';
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
                               FData := Label_Data.Text;
                               FItem := '';
                               FQuantidade := '';
                               FUnidade := '';
                               FStatus := 'Comprar';
                               Btn_apaga_Item.Visible := false;
                               //ListaDeProdutos.Selected.Index := -1;
                               ListaDeProdutos.ItemIndex := -1;
                               ListaDeProdutos.ScrollTo(0);
                               //MontaListaProdutos;
                             end,
                             Procedure ()
                             begin

                             end,
                             Procedure()
                             begin
                               TabListas.GotoVisibleTab(TabListasEditaNovo.Index);
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
                                     FMensagem := tpmLists_Editada;
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
                                     FMensagem := tpmLists_Inserida;
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

procedure Tandroid_listas.ListaDeProdutosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  Edit_Produto.Text := AItem.Text;
end;

procedure Tandroid_listas.ListaMercadoItemClickEx(const Sender: TObject;
ItemIndex: Integer; const LocalClickPos: TPointF;
const ItemObject: TListItemDrawable);
Var
  ErroStatus : string;
begin
  if TListView(Sender).Selected <> nil then
  begin
    if ItemObject is TListItemImage then
    begin
      if ItemObject.Name = 'Img_Status' then
      begin
        if ItemObject.TagString = 'Comprar' then
        begin
          TControllerFactory.New.ItemLista
            .data(FData)
            .id(TListView(sender).Items[ItemIndex].TagString)
            .Status('Comprado')
            .MudaStatus(ErroStatus);
            if ErroStatus = '' then
            begin
             TListItemImage(ItemObject).Bitmap := Img_item_comprado.Bitmap;
             ItemObject.TagString := 'Comprado';
            end;
        end
        else
        begin
          TControllerFactory.New.ItemLista
            .data(FData)
            .id(TListView(sender).Items[ItemIndex].TagString)
            .Status('Comprar')
            .MudaStatus(ErroStatus);
            if ErroStatus = '' then
             begin
              TListItemImage(ItemObject).Bitmap := Img_item_comprar.Bitmap;
              ItemObject.TagString := 'Comprar';
             end;
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

procedure Tandroid_listas.ListaMercadoPullRefresh(Sender: TObject);
begin
  ListarItens(FData);
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
