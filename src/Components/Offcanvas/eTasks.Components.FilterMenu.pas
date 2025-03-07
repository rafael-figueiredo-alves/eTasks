unit eTasks.Components.FilterMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.Components.Offcanvas, System.ImageList, FMX.ImgList, FMX.Layouts,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.MultiView,
  eTasks.Components.Interfaces;

type
  TFilterMenu = class(TOffcanvas)
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Form: TForm; isDarkMode: Boolean = false): iOffcanvas;
  end;

var
  FilterMenu: TFilterMenu;

implementation

{$R *.fmx}

{ TFilterMenu }

class function TFilterMenu.New(const Form: TForm;isDarkMode: Boolean): iOffcanvas;
begin
  Result := Self.Create(Form);
  TFilterMenu(Result).Multiview.Size.Width := 0;
  TFilterMenu(Result).SetDirection(ocdRight);
  TFilterMenu(Result).LytBtnFilters.Visible := true;
  Result.isDarkMode(isDarkMode);
  Form.AddObject(TFilterMenu(Result).Multiview);
end;

end.
