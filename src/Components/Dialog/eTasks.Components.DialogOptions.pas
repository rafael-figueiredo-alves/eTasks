unit eTasks.Components.DialogOptions;

interface

uses
  eTasks.Components.DialogType,
  eTasks.Components.Interfaces;

type

  TDialogOptions = class
    private
      fTitulo         : string;
      fMensagem       : string;
      fTipoDeDialogo  : TDialogType;
      fStacktrace     : string;
      fConfirmarClick : TEventoClick;
      fCancelarClick  : TEventoClick;
    public
      constructor create; overload;
      constructor create(const _titulo, _mensagem: string; _tipoDialogo: TDialogType = TDialogType.ConfirmDelete;
                               _confirmarClick: TEventoClick = nil; _cancelarClick: TEventoClick = nil;
                               _stackTrace: string = ''); overload;

      property Titulo         : string       read fTitulo         write fTitulo;
      property Mensagem       : string       read fMensagem       write fMensagem;
      property TipoDeDialogo  : TDialogType  read fTipoDeDialogo  write fTipoDeDialogo;
      property Stacktrace     : string       read fStacktrace     write fStacktrace;
      property ConfirmarClick : TEventoClick read fConfirmarClick write fConfirmarClick;
      property CancelarClick  : TEventoClick read fCancelarClick  write fCancelarClick;
  end;

implementation

{ TDialogOptions }

constructor TDialogOptions.create;
begin
  inherited Create;
  fTitulo        := '';
  fMensagem      := '';
  fStacktrace    := '';
  fTipoDeDialogo := TDialogType.ConfirmDelete;
end;

constructor TDialogOptions.create(const _titulo, _mensagem: string;
  _tipoDialogo: TDialogType; _confirmarClick, _cancelarClick: TEventoClick;
  _stackTrace: string);
begin
  inherited Create;
  fTitulo         := _titulo;
  fMensagem       := _mensagem;
  fTipoDeDialogo  := _tipoDialogo;
  fConfirmarClick := _confirmarClick;
  fCancelarClick  := _cancelarClick;
  fStacktrace     := _stackTrace;
end;

end.
