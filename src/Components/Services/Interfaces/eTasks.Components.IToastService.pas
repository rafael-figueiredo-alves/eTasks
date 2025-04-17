unit eTasks.Components.IToastService;

interface

uses
  eTasks.Components.ToastType;

type

 TOnShow = procedure(const Mensagem: string; const Tipo: TToastType) of object;
 TOnHide = procedure of object;

 iToastService = interface
   ['{1446B0E1-8BE3-4A74-A913-55FD72495299}']
   function OnShow(const OnShowMethod: TOnShow): iToastService;
   function OnHide(const OnHideMethod: TOnHide): iToastService;
   procedure ShowSuccess(const Mensagem: string);
   procedure ShowError(const Mensagem: string);
   procedure Hide;
 end;

implementation

end.
