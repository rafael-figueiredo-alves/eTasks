program eTasks;

uses
  System.StartUpCopy,
  FMX.Forms,
  Skia.FMX,
  uMain in 'src\View\uMain.pas' {frmMain};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
