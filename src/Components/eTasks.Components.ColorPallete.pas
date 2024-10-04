unit eTasks.Components.ColorPallete;

interface

uses
  System.UITypes;

type

  Cor =
       (
        Primary,
        Secondary,
        Background,
        FabButton,
        OkButton,
        CancelButton,
        Shadow,
        Text
       );

  tColorPallete = class
      class function GetColor(const _cor: Cor; isDarkMode: boolean): TAlphaColor;
  end;

implementation

{ tColorPallete }

function Iif(const Condicao: boolean; ResultTrue: TAlphaColor; ResultFalse: TAlphaColor) : TAlphaColor;
begin
  if(Condicao)then
   Result := ResultTrue
  else
   Result := ResultFalse;
end;

class function tColorPallete.GetColor(const _cor: Cor; isDarkMode: boolean): TAlphaColor;
begin
  case _cor of
    Primary      : Result := Iif(isDarkMode, $ffFFFFFF, $ff336699);
    Secondary    : Result := Iif(isDarkMode, $ff807E7E, $ffB8CADB);
    Background   : Result := Iif(isDarkMode, $ff212529, $ffFFFFFF);
    FabButton    : Result := Iif(isDarkMode, $ff336699, $ff66BB6A);
    OkButton     : Result := Iif(isDarkMode, $ff66BB6A, $ff66BB6A);
    CancelButton : Result := Iif(isDarkMode, $ffEE5351, $ffEE5351);
    Shadow       : Result := Iif(isDarkMode, $ff646464, $ff000000);
    Text         : Result := Iif(isDarkMode, $ffFFFFFF, $ff000000);
  else
    Result := Iif(isDarkMode, $ffFFFFFF, $f336699);
  end;
end;

end.
