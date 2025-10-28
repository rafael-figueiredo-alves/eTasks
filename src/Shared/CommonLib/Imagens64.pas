unit Imagens64;

interface

Uses
 System.SysUtils,
 System.Classes,
 FMX.Graphics,
 Soap.EncdDecd,
 System.NetEncoding;

Type
  TImagens64 = class
    Class function toBase64   (Bitmap : tBitmap) : String;
    Class function fromBase64 (const Base64: string) : TBitmap;
  end;

implementation

{ TImagens64 }

class function TImagens64.fromBase64(const Base64: string): TBitmap;
Var
  Entrada : TStringStream;
  Saida   : TBytesStream;
begin
  Entrada := TStringStream.Create(Base64, TEncoding.ASCII);
  try
   Saida := TBytesStream.Create;
   try
     Soap.EncdDecd.DecodeStream(entrada, saida);
     saida.Position := 0;
     Result := TBitmap.Create;
     try
      Result.LoadFromStream(saida);
     except
      FreeAndNil(Result);
     end;
   finally
    FreeAndNil(Saida);
   end;
  finally
   FreeAndNil(entrada);
  end;
end;

class function TImagens64.toBase64(Bitmap: tBitmap): String;
var
 Entrada : TBytesStream;
 Saida   : TStringStream;
begin
  Entrada := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Entrada);
    Entrada.Position := 0;
    Saida := TStringStream.Create('', TEncoding.ASCII);
    try
      soap.EncdDecd.EncodeStream(Entrada, Saida);
      Result := Saida.DataString;
    finally
      FreeAndNil(Saida);
    end;
  finally
    FreeAndNil(Entrada);
  end;
end;

end.
