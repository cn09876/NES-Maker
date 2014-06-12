unit UnitNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FileCtrl;

type
  TnewPJ = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    PJ_path: TLabeledEdit;
    PJ_file: TLabeledEdit;
    TrackPath: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Bevel1: TBevel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure TrackPathClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _Dir, _File : string;
  end;

var
  newPJ: TnewPJ;

implementation

uses UnitDir ;

{$R *.dfm}

procedure TnewPJ.TrackPathClick(Sender: TObject);
var
  FDir: TDir;
begin
  FDir := TDir.Create(Nil);
  FDir._dir := _Dir ;
  FDir.ShowModal;
  _Dir := FDir._dir ;
  FDir.Free;
end;

end.
