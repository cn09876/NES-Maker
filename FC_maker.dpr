program FC_maker;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {MainForm},
  UnitAbout in 'UnitAbout.pas' {AboutBox},
  UnitG in 'UnitG.pas',
  UnitNewPJ in 'UnitNewPJ.pas' {newPJ},
  UnitDir in 'UnitDir.pas' {Dir},
  UnitNewCode in 'UnitNewCode.pas' {newCode},
  UnitENVIRONMENT in 'UnitENVIRONMENT.pas' {FormENVIRONMENT};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'FC_Maker';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
