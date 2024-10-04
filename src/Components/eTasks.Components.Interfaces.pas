unit eTasks.Components.Interfaces;

interface

uses
  FMX.Objects;

type
  TEventoClick = procedure(sender: TObject) of object;

  iAppBar = interface
    ['{D3781F3B-96FF-4017-9F8E-5472178C9ABB}']
    function ChangeTitle(const Title: string): iAppBar;
    function ShowTitleBar(const value: Boolean): TRectangle;
    function Render: TRectangle;
    function ThemeChangerClick(const Evento: TEventoClick): iAppBar;
    function isDarkMode(const value: boolean): iAppBar;
  end;

implementation


end.
