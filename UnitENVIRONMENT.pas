unit UnitENVIRONMENT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormENVIRONMENT = class(TForm)
    GroupBox0: TGroupBox;
    Edit0: TEdit;
    CheckBox0: TCheckBox;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label0: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Edit3: TEdit;
    CheckBox3: TCheckBox;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Edit4: TEdit;
    CheckBox4: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Def : array[0..4] of string;
    Key : array[0..4] of string;
    AStart : array[0..4] of Cardinal;
    ALength : array[0..4] of Cardinal;
    w : array[0..4] of integer;

    function readENVIRONMENT(const strName : string):string;
    function inttoop(const u : integer):string;
    procedure writeENVIRONMENT(const strName, strENV : string);

  public
    { Public declarations }
    procedure load(const ID :integer; const strName, strKey, strDef : string );
  end;

var
  FormENVIRONMENT: TFormENVIRONMENT;

implementation

uses StrUtils, Registry;
{$R *.dfm}

function TFormENVIRONMENT.readENVIRONMENT(const strName : string):string;
var
  p : PChar;
begin
  //GetEnvironmentStrings;
  p := AllocMem(32768);;
  GetEnvironmentVariable(pchar(strName),p,32767);
  Result := String(p);
  FreeMem(p);
end;

function TFormENVIRONMENT.inttoop(const u : integer):string;
begin
  case u of
  0: Result := '替换';
  1: Result := '追加';
  2: Result := '覆盖';
  else Result :='';
  end;
end;

procedure TFormENVIRONMENT.load(const ID :integer; const strName, strKey, strDef : string );
var
  s, strEnv : string;
  t, tf, td, i : integer;
begin
  strEnv := readENVIRONMENT(strName);
  if (length(strKey)>0) and (length(strEnv)>0) then
    begin
     t := Pos(strKey, lowercase(strEnv));
     if t>0 then
       begin
         td := PosEx(';', strEnv, t);
         if td=0 then td := length(strEnv) else dec(td);
         i := 1;
         tf := i;
         while (i>0) and (i<td) do
          begin
            tf := i;
            i := PosEx(';', strEnv, i+1);
            //MessageDlg('i='+inttostr(i), mtError, [mbOK], 0) ;
          end;
         if tf>1 then inc(tf);
         AStart[ID] := tf;
         ALength[ID] := td-tf+1;
         s := copy(strEnv, AStart[ID], ALength[ID]);
         w[ID] := 0;
       end
      else
       begin
         AStart[ID] := 0;
         ALength[ID] := 0;
         s := '';
         w[ID] := 1;
       end;
    end
    else
    begin
     s := strEnv;
     w[ID] := 2;
    end;
  Key[ID] := strKey;
  Def[ID] := strDef;
  case ID of
  0: begin
       GroupBox0.Caption := strName;
       Label0.Caption := inttoop(w[ID]);
       Edit0.Text := s;
       GroupBox0.Visible := true;
     end;
  1: begin
       GroupBox1.Caption := strName;
       Label1.Caption := inttoop(w[ID]);
       Edit1.Text := s;
       GroupBox1.Visible := true;
     end;
  2: begin
       GroupBox2.Caption := strName;
       Label2.Caption := inttoop(w[ID]);
       Edit2.Text := s;
       GroupBox2.Visible := true;
     end;
  3: begin
       GroupBox3.Caption := strName;
       Label3.Caption := inttoop(w[ID]);
       Edit3.Text := s;
       GroupBox3.Visible := true;
     end;
  4: begin
       GroupBox4.Caption := strName;
       Label4.Caption := inttoop(w[ID]);
       Edit4.Text := s;
       GroupBox4.Visible := true;
     end;
  end;
end;

procedure TFormENVIRONMENT.Button1Click(Sender: TObject);
begin
  if CheckBox0.Checked then Edit0.Text := Def[0];
  if CheckBox1.Checked then Edit1.Text := Def[1];
  if CheckBox2.Checked then Edit2.Text := Def[2];
  if CheckBox3.Checked then Edit3.Text := Def[3];
  if CheckBox4.Checked then Edit4.Text := Def[4];
end;

procedure TFormENVIRONMENT.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TFormENVIRONMENT.Button2Click(Sender: TObject);
var
  i : integer;
  strName, s, strEnv : string;
  DO_Key : boolean;
begin    //保存
  showmessage('确认已关闭注册表监视软件。否则软件死机。');
  DO_Key := false;
  for i := 0 to 4 do
   begin
     case i of
     0: begin
          strName := GroupBox0.Caption ;
          s := Edit0.Text ;
          DO_Key := GroupBox0.Visible ;
        end;
     1: begin
          strName := GroupBox1.Caption ;
          s := Edit1.Text ;
          DO_Key := GroupBox1.Visible ;
        end;
     2: begin
          strName := GroupBox2.Caption ;
          s := Edit2.Text ;
          DO_Key := GroupBox2.Visible ;
        end;
     3: begin
          strName := GroupBox3.Caption ;
          s := Edit3.Text ;
          DO_Key := GroupBox3.Visible ;
        end;
     4: begin
          strName := GroupBox4.Caption ;
          s := Edit4.Text ;
          DO_Key := GroupBox4.Visible ;
        end;
     end;

     if DO_Key then
       begin
         case w[i] of
           0: //'替换'
              begin
                strEnv := readENVIRONMENT(strName);
                strEnv := StuffString(strEnv, AStart[i],ALength[i], s);
                writeENVIRONMENT(strName, strEnv);
              end;
           1: //'追加'
              begin
                strEnv := readENVIRONMENT(strName) + ';' + s;
                writeENVIRONMENT(strName, strEnv);
              end;
           2: //'覆盖'
              begin
                strEnv := s;
                writeENVIRONMENT(strName, strEnv);
              end;
         end;
       end;
   end;
end;

procedure TFormENVIRONMENT.writeENVIRONMENT(const strName, strENV : string);
var  
  reg : TRegistry;  
  sLMKey : string;  
begin
  sLMKey := 'System\CurrentControlSet\Control\Session Manager\Environment';  //环境变量保存在注册表的这个位置
  reg := TRegistry.Create;
  try  
    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.OpenKey(sLMKey,False) then  
      begin
        reg.WriteExpandString(strName, strENV);  //把值写到注册表里
        reg.CloseKey;
        SetEnvironmentVariable(PChar(strName),PChar(strENV));//更新当前进程的环境变量
        SendMessage(HWND_BROADCAST,WM_SETTINGCHANGE,0,Integer(PChar('Environment'))); //通知所有上层窗口，环境参数变化
        ShowMessage('环境变量'+strName+'修改成功');
      end  
      else  
        ShowMessage('注册表的环境变量小节不能打开。');

  except  
    on E: Exception do  
    begin
      reg.Free;
      ShowMessage('Error: ' + E.Message);  
      Exit;  
    end;  
  end;  
  reg.Free;
end;



end.
