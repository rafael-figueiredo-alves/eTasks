unit eTasks.Shared.Utils;

interface

type

   TProc = reference to procedure; // Tipo para procedimentos
   TFunc<T> = reference to function: T; // Tipo genérico para funções que retornam T

   TUtils = class
      class function Iif<T>(const Condition: Boolean; ResultTrue, ResultFalse: T) : T; overload; static;
      class procedure Iif(const Condition: Boolean; ProcTrue, ProcFalse: TProc); overload; static;
      class function Iif<T>(const Condition: Boolean; FuncTrue, FuncFalse: TFunc<T>): T; overload; static;
   end;

implementation

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

end.
