unit eTasks.Shared.Utils;

interface

uses
  System.Rtti, Generics.Collections;

type

   TProc = reference to procedure; // Tipo para procedimentos
   TFunc<T> = reference to function: T; // Tipo genérico para funções que retornam T

   TUtils = class
      class function Iif<T>(const Condition: Boolean; ResultTrue, ResultFalse: T) : T; overload; static;
      class procedure Iif(const Condition: Boolean; ProcTrue, ProcFalse: TProc); overload; static;
      class function Iif<T>(const Condition: Boolean; FuncTrue, FuncFalse: TFunc<T>): T; overload; static;
      class procedure ExecuteMethodWithParams(const List: TList<IInterface>; const MethodName: string; const Params: array of TValue); static;
   end;



implementation

uses
  System.SysUtils, FMX.Forms;

{ TUtils }

class function TUtils.Iif<T>(const Condition: Boolean; ResultTrue, ResultFalse: T): T;
begin
  if(Condition)then
   Result := ResultTrue
  else
   Result := ResultFalse;
end;

class procedure TUtils.Iif(const Condition: Boolean; ProcTrue, ProcFalse: TProc);
begin
  if(Condition)then
    ProcTrue()
  else
    ProcFalse();
end;

class function TUtils.Iif<T>(const Condition: Boolean; FuncTrue, FuncFalse: TFunc<T>): T;
begin
  if(Condition)then
    Result := FuncTrue()
  else
    Result := FuncFalse();
end;

class procedure TUtils.ExecuteMethodWithParams(const List: TList<IInterface>; const MethodName: string; const Params: array of TValue);
var
  Context: TRttiContext;
  RttiType: TRttiType;
  RttiMethod: TRttiMethod;
  Item: IInterface;
  Obj: TObject;
begin
  Context := TRttiContext.Create;
  try
    for Item in List do
    begin
      // Tenta fazer um cast seguro da interface para um objeto base
      if Item is TInterfacedObject then
        Obj := TInterfacedObject(Item)
      else if Item is TForm then
        Obj := TForm(Item)
      else
        Obj := nil; // Não é um objeto suportado

      if Assigned(Obj) then
      begin
        RttiType := Context.GetType(Obj.ClassType); // Obtém o tipo RTTI
        RttiMethod := RttiType.GetMethod(MethodName);
        if Assigned(RttiMethod) then
        begin
          // Verifica se a assinatura do método é compatível
          if Length(RttiMethod.GetParameters) = Length(Params) then
          begin
            // Chama o método dinamicamente
            RttiMethod.Invoke(Obj, Params);
          end
          else
          begin
            Writeln(Format('Method "%s" found, but parameter count mismatch.', [MethodName]));
          end;
        end
        else
        begin
          Writeln(Format('Method "%s" not found on %s', [MethodName, Obj.ClassName]));
        end;
      end
      else
      begin
        Writeln('Item is not a supported object type.');
      end;
    end;
  finally
    Context.Free;
  end;
end;

end.
