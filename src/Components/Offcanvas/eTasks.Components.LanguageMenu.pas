unit eTasks.Components.LanguageMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.Components.Offcanvas, System.ImageList, FMX.ImgList, FMX.Layouts,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.MultiView,
  eTasks.Components.Interfaces;

type
  TLanguageMenu = class(TOffcanvas)
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Form: TForm; isDarkMode: Boolean = false): iOffcanvas;
  end;

var
  LanguageMenu: TLanguageMenu;

implementation

{$R *.fmx}

{ TLanguageMenu }

class function TLanguageMenu.New(const Form: TForm;isDarkMode: Boolean): iOffcanvas;
begin
  Result := Self.Create(Form);
  TLanguageMenu(Result).Multiview.Size.Width := 0;
  TLanguageMenu(Result).SetDirection(ocdLeft);
  TLanguageMenu(Result).LytBtnFilters.Visible := false;
  Result.isDarkMode(isDarkMode);
  Form.AddObject(TLanguageMenu(Result).Multiview);
end;

end.
