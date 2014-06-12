unit UnitDir;    //[OK]

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, ShellCtrls;

type
  TDir = class(TForm)
    Button1: TButton;
    ShellTreeView1: TShellTreeView;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure setup;
  public
    { Public declarations }
    _dir : string;
  end;

var
  Dir: TDir;

implementation

{$R *.dfm}

procedure TDir.Button1Click(Sender: TObject);
begin
  _dir := ShellTreeView1.Path + '\';
  close;
end;

procedure TDir.setup;
begin
    ShellTreeView1.Path := _dir;
end;

procedure TDir.FormShow(Sender: TObject);
begin
  setup;
end;

procedure TDir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

end.
