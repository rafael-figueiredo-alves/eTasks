unit eTasks.View.Components.Calendario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl, FMX.Ani;

type
  TCliqueData = Procedure (Value : TDate) of object;

  TCalendario = class(TFrame)
    Fundo: TRectangle;
    Lay_ano: TLayout;
    Label_ano: TLabel;
    Btn_Volta_Ano: TImage;
    Btn_avanca_ano: TImage;
    Lay_mes: TLayout;
    Label_mes: TLabel;
    Btn_volta_mes: TImage;
    Btn_Avanca_mes: TImage;
    Tab_Cal: TTabControl;
    mes_1: TTabItem;
    mes_2: TTabItem;
    mes_3: TTabItem;
    mes_4: TTabItem;
    mes_5: TTabItem;
    mes_6: TTabItem;
    mes_7: TTabItem;
    mes_8: TTabItem;
    mes_9: TTabItem;
    mes_10: TTabItem;
    mes_11: TTabItem;
    mes_12: TTabItem;
    Lay_calendario: TLayout;
    Lay_dias_semana: TLayout;
    Linha_inf_dias_semana: TLine;
    Label_domingo: TLabel;
    Label_segunda: TLabel;
    Label_terca: TLabel;
    Label_quarta: TLabel;
    Label_quinta: TLabel;
    Label_sexta: TLabel;
    Label_sabado: TLabel;
    Lay_semana_1: TLayout;
    Dia_1: TLabel;
    Dia_2: TLabel;
    Dia_3: TLabel;
    Dia_4: TLabel;
    Dia_5: TLabel;
    Dia_6: TLabel;
    Dia_7: TLabel;
    Lay_semana_2: TLayout;
    Dia_8: TLabel;
    Dia_9: TLabel;
    Dia_10: TLabel;
    Dia_11: TLabel;
    Dia_12: TLabel;
    Dia_13: TLabel;
    Dia_14: TLabel;
    Lay_semana_3: TLayout;
    Dia_15: TLabel;
    Dia_16: TLabel;
    Dia_17: TLabel;
    Dia_18: TLabel;
    Dia_19: TLabel;
    Dia_20: TLabel;
    Dia_21: TLabel;
    Lay_semana_4: TLayout;
    Dia_22: TLabel;
    Dia_23: TLabel;
    Dia_24: TLabel;
    Dia_25: TLabel;
    Dia_26: TLabel;
    Dia_27: TLabel;
    Dia_28: TLabel;
    Lay_semana_5: TLayout;
    Dia_29: TLabel;
    Dia_30: TLabel;
    Dia_31: TLabel;
    Dia_32: TLabel;
    Dia_33: TLabel;
    Dia_34: TLabel;
    Dia_35: TLabel;
    Lay_semana_6: TLayout;
    Dia_36: TLabel;
    Dia_37: TLabel;
    Dia_38: TLabel;
    Dia_39: TLabel;
    Dia_40: TLabel;
    Dia_41: TLabel;
    Dia_42: TLabel;
    Seletor: TArc;
    AnimaSeletor: TFloatAnimation;
    procedure Btn_volta_mesClick(Sender: TObject);
    procedure Btn_Avanca_mesClick(Sender: TObject);
    procedure Btn_Volta_AnoClick(Sender: TObject);
    procedure Btn_avanca_anoClick(Sender: TObject);
    procedure Dia_1Click(Sender: TObject);
  private
    { Private declarations }
    FDia    : word;
    FMes    : word;
    FAno    : word;
    FClique : TCliqueData;
    Procedure MontarCalendario;
    Procedure LimpaCalendario;
    Function Mes(value : Integer): string;
    Function DataSelecionada : TDate;
  public
    { Public declarations }
    Function Iniciar(FDate : TDate; FParent : TFmxObject) : TCalendario;
    Function EvSelecionaData (Value : TCliqueData): TCalendario;
  end;

implementation

{$R *.fmx}

{ TCalendario }

procedure TCalendario.Btn_avanca_anoClick(Sender: TObject);
begin
  FAno := FAno + 1;
  LimpaCalendario;
  MontarCalendario;
  FClique(DataSelecionada);
end;

procedure TCalendario.Btn_Avanca_mesClick(Sender: TObject);
begin
  Fmes := Fmes + 1;
  Btn_volta_mes.Enabled := True;
  if Fmes = 12 then
   begin
     Btn_volta_mes.Enabled := true;
     Btn_Avanca_mes.Enabled := false;
   end;
  Tab_Cal.GotoVisibleTab(Fmes -1);
  LimpaCalendario;
  Lay_calendario.Parent := TTabItem(FindComponent('mes_'+FMes.ToString));
  MontarCalendario;
  FClique(DataSelecionada);
end;

procedure TCalendario.Btn_Volta_AnoClick(Sender: TObject);
begin
  FAno := FAno - 1;
  LimpaCalendario;
  MontarCalendario;
  FClique(DataSelecionada);
end;

procedure TCalendario.Btn_volta_mesClick(Sender: TObject);
begin
  Fmes := Fmes - 1;
  Btn_Avanca_mes.Enabled := True;
  if Fmes = 1 then
   begin
     Btn_volta_mes.Enabled := false;
     Btn_avanca_mes.Enabled := true;
   end;
  Tab_Cal.GotoVisibleTab(Fmes - 1);
  LimpaCalendario;
  Lay_calendario.Parent := TTabItem(FindComponent('mes_'+FMes.ToString));
  MontarCalendario;
  FClique(DataSelecionada);
end;

function TCalendario.DataSelecionada: TDate;
begin
  Result := EncodeDate(FAno, FMes, FDia);
end;

procedure TCalendario.Dia_1Click(Sender: TObject);
begin
  if TLabel(Sender).Text <> '' then
   begin
     FDia := TLabel(Sender).Text.ToInteger;
     Seletor.EndAngle := 0;
     Seletor.Parent := TLabel(sender);
     AnimaSeletor.Start;
     FClique(DataSelecionada);
   end;
end;

function TCalendario.EvSelecionaData(Value: TCliqueData): TCalendario;
begin
  Result := Self;
  FClique := Value;
end;

function TCalendario.Iniciar(FDate: TDate; FParent: TFmxObject): TCalendario;
begin
  Result := Self;
  Self.Parent := FParent;
  DecodeDate(FDate, FAno, FMes, FDia);
  Tab_Cal.ActiveTab := TTabItem(FindComponent('mes_'+FMes.ToString));
  Lay_calendario.Parent := Tab_Cal.ActiveTab;
  LimpaCalendario;
  MontarCalendario;
  FClique(DataSelecionada);
end;

procedure TCalendario.LimpaCalendario;
var i : Integer;
begin
  for I := 1 to 42 do
   begin
    TLabel(FindComponent('Dia_'+i.ToString)).Text := '';
    TLabel(FindComponent('Dia_'+i.ToString)).Cursor := crDefault;
   end;
end;

function TCalendario.Mes(value: Integer): string;
begin
  case value of
  1: Result := 'Janeiro';
  2: Result := 'Fevereiro';
  3: Result := 'Março';
  4: Result := 'Abril';
  5: Result := 'Maio';
  6: Result := 'Junho';
  7: Result := 'Julho';
  8: Result := 'Agosto';
  9: Result := 'Setembro';
  10: Result := 'Outubro';
  11: Result := 'Novembro';
  12: Result := 'Dezembro';
  end;
end;

procedure TCalendario.MontarCalendario;
var
 dia          : word;
 PrimeiroDia  : Word;
 Fdata        : TDate;
 i, Pos_dia   : integer;
 total        : integer;
 N_Dia         : integer;
begin
  dia := 1;
  Total := 0;
  Label_mes.Text := mes(fMes);
  Label_ano.Text := FAno.ToString;
  FData := EncodeDate(FAno, FMes, dia);
  PrimeiroDia := DayOfWeek(Fdata);
  TLabel(FindComponent('Dia_'+primeirodia.ToString)).Text := '1';
  case FMes of
  1: total := 30 + PrimeiroDia;
  2: begin
       if IsLeapYear(Fano) = true then
        total := 28 + PrimeiroDia
       else
        total := 27 + PrimeiroDia;
     end;
  3:  total := 30 + PrimeiroDia;
  4:  total := 29 + PrimeiroDia;
  5:  total := 30 + PrimeiroDia;
  6:  total := 29 + PrimeiroDia;
  7:  total := 30 + PrimeiroDia;
  8:  total := 30 + PrimeiroDia;
  9:  total := 29 + PrimeiroDia;
  10: total := 30 + PrimeiroDia;
  11: total := 29 + PrimeiroDia;
  12: total := 30 + PrimeiroDia;
  end;
  Pos_dia := PrimeiroDia + 1;
  N_Dia := 2;
  for I := Pos_dia to total do
   begin
     TLabel(FindComponent('Dia_'+i.ToString)).Text := N_Dia.ToString;
     TLabel(FindComponent('Dia_'+i.ToString)).Cursor := crHandPoint;
     N_Dia := N_Dia + 1;
   end;
  Seletor.EndAngle := 0;
  Seletor.Parent := TLabel(FindComponent('Dia_' + inttostr((primeirodia + Fdia) - 1)));
  AnimaSeletor.Start;
end;

end.
