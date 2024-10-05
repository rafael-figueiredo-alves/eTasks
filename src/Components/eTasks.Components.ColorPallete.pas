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

uses
  eTasks.Shared.Utils;

{ tColorPallete }

class function tColorPallete.GetColor(const _cor: Cor; isDarkMode: boolean): TAlphaColor;
begin
  case _cor of
    Primary      : Result := TUtils.Iif(isDarkMode, $ffFFFFFF, $ff336699);
    Secondary    : Result := TUtils.Iif(isDarkMode, $ff807E7E, $ffB8CADB);
    Background   : Result := TUtils.Iif(isDarkMode, $ff212529, $ffFFFFFF);
    FabButton    : Result := TUtils.Iif(isDarkMode, $ff336699, $ff66BB6A);
    OkButton     : Result := TUtils.Iif(isDarkMode, $ff66BB6A, $ff66BB6A);
    CancelButton : Result := TUtils.Iif(isDarkMode, $ffEE5351, $ffEE5351);
    Shadow       : Result := TUtils.Iif(isDarkMode, $ff646464, $ff000000);
    Text         : Result := TUtils.Iif(isDarkMode, $ffFFFFFF, $ff000000);
  else
    Result := TUtils.Iif<TAlphaColor>(isDarkMode, $ffFFFFFF, $f336699);
  end;
end;

end.
