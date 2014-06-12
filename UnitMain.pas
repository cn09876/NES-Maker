unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, ToolWin, ImgList, IniFiles, Buttons;

type
  TMainForm = class(TForm)
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    PopupMenu1: TPopupMenu;
    OpenBut: TMenuItem;
    CloseBut: TMenuItem;
    N3: TMenuItem;
    X1: TMenuItem;
    ImageList1: TImageList;
    Panel3: TPanel;
    ToolButton2: TToolButton;
    CompileBut: TToolButton;
    BuildBut: TToolButton;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    StaticText3: TStaticText;
    GroupBox2: TGroupBox;
    NewBut: TMenuItem;
    Panel5: TPanel;
    Memo1: TMemo;
    RunBut: TToolButton;
    ToolButton9: TToolButton;
    ConfigBut: TMenuItem;
    N5: TMenuItem;
    ComBut: TToolButton;
    ToolButton21: TToolButton;
    PopupMenu2: TPopupMenu;
    Eum1: TMenuItem;
    Eum2: TMenuItem;
    Eum3: TMenuItem;
    Eum4: TMenuItem;
    Eum5: TMenuItem;
    ToolButton22: TToolButton;
    HistoryBut: TToolButton;
    HelpBut: TToolButton;
    AboutBut: TToolButton;
    ToolButton26: TToolButton;
    Panel6: TPanel;
    Panel7: TPanel;
    StaticText4: TStaticText;
    Panel8: TPanel;
    GroupBox3: TGroupBox;
    Memo2: TMemo;
    GroupBox4: TGroupBox;
    Panel9: TPanel;
    GroupBox5: TGroupBox;
    But0: TButton;
    But1: TButton;
    But2: TButton;
    But3: TButton;
    Bt0: TButton;
    Bt1: TButton;
    Bt2: TButton;
    Bt3: TButton;
    Bt4: TButton;
    InfoBut: TMenuItem;
    Timer1: TTimer;
    SB1: TSpeedButton;
    Bevel1: TBevel;
    SB2: TSpeedButton;
    SB3: TSpeedButton;
    SB4: TSpeedButton;
    Bevel2: TBevel;
    SB5: TSpeedButton;
    SB6: TSpeedButton;
    SB7: TSpeedButton;
    SB8: TSpeedButton;
    ToolButton5: TToolButton;
    PopupMenu3: TPopupMenu;
    Tla: TMenuItem;
    Tlb: TMenuItem;
    Tlc: TMenuItem;
    Tld: TMenuItem;
    N7: TMenuItem;
    Ex1: TMenuItem;
    Ex2: TMenuItem;
    Ex3: TMenuItem;
    Ex4: TMenuItem;
    Ex5: TMenuItem;
    Ex6: TMenuItem;
    Ex7: TMenuItem;
    Ex8: TMenuItem;
    ListView1: TListView;
    ImageList2: TImageList;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    OpenDialog2: TOpenDialog;
    OpenDialog3: TOpenDialog;
    N1: TMenuItem;
    Button1: TButton;
    H1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure AboutButClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure GroupBox1DblClick(Sender: TObject);
    procedure GroupBox3DblClick(Sender: TObject);
    procedure Bt4Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure StatusBar2DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure NewButClick(Sender: TObject);
    procedure CloseButClick(Sender: TObject);
    procedure OpenButClick(Sender: TObject);
    procedure Bt2Click(Sender: TObject);
    procedure Bt3Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListBox1Click(Sender: TObject);
    procedure But0Click(Sender: TObject);
    procedure But1Click(Sender: TObject);
    procedure But2Click(Sender: TObject);
    procedure But3Click(Sender: TObject);
    procedure InfoButClick(Sender: TObject);
    procedure Bt0Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure CompileButClick(Sender: TObject);
    procedure BuildButClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunButClick(Sender: TObject);
    procedure ComButClick(Sender: TObject);
    procedure HistoryButClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Recording_Time(m : integer);
    procedure NES_Refresh;
    procedure LIB_Refresh(Mandatory : boolean);
//    procedure READ_PJ_INFO;
    function ExtToID(fExt: string):Integer;
    function ThePJFile:string;
    function ReadFunction(var Comm : string; SelectionFile : string):boolean;
    function RunFunction(const C ,CheckFile,CurrentDir: string; Show: integer):boolean;
    procedure MyOperation(const Operation, oFile: string;const ID,show : integer);
    procedure showICO;
    function Identification(const Comm, SelectionFile : string):string;
    function GetName(const ID:integer;const D,F : string):string;
  public
    { Public declarations }
    ProjectTemplate : string;
    function_pass : Boolean;
    ListViewStop : boolean;
    APP_cfg: TiniFile;
    PJ: TiniFile;
    lostFile :boolean;
    LastDir, LastFile : string;
  end;

type
 Rfile = record
   fname  : string;
   ftype : string;
 end;

function IsFileInUse(AName: string): boolean;

var
  MainForm: TMainForm;
  ProgramDir: string;
  ProjectDir: string;
  ProjectFile: string;
  TheLibFile, LibFile: string;
  PJ_opened: Boolean ;

implementation

uses UnitAbout, UnitG, UnitNewPJ, UnitNewCode, UnitENVIRONMENT, StrUtils;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var
 ProgressBarStyle1, ProgressBarStyle2: integer;
 D, F : string;
 HaveHistory : boolean;
begin
  lostFile := false;
  ProgramDir := ExtractFilePath(Paramstr(0));
  PJ_opened := False;
  MainForm.Width := 405;
  ListView1.Clear;
  Memo1.Clear;
  Memo2.Clear;
  ListBox1.Clear;
  //Memo1.Lines.Add(ProgramDir) ;

  //将状态栏的第二块面板设为的自绘（即psOwnerDraw）
  StatusBar1.Panels[1].Style := psOwnerDraw;
  //将进程条放入状态栏
  ProgressBar1.Parent := StatusBar1;
  //去除状态栏的边框，这样就与状态栏溶为一体了　
  ProgressBarStyle1 := GetWindowLong(ProgressBar1.Handle,GWL_EXSTYLE);
  ProgressBarStyle1 := ProgressBarStyle1 - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle, GWL_EXSTYLE, ProgressBarStyle1);

  //将状态栏的第二块面板设为的自绘（即psOwnerDraw）
  StatusBar2.Panels[1].Style := psOwnerDraw;
  //将进程条放入状态栏
  ProgressBar2.Parent := StatusBar2;
  //去除状态栏的边框，这样就与状态栏溶为一体了　
  ProgressBarStyle2 := GetWindowLong(ProgressBar2.Handle,GWL_EXSTYLE);
  ProgressBarStyle2 := ProgressBarStyle2 - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar2.Handle, GWL_EXSTYLE, ProgressBarStyle2);
  APP_cfg := TiniFile.Create(GetName(1,'',''));
  D := APP_cfg.ReadString('History','ProjectDir','') ;
  F := APP_cfg.ReadString('History','ProjectFile','') ;
  HaveHistory := FileExists(GetName(0, D, F));
  HistoryBut.Enabled := HaveHistory;
  N2.Enabled := HaveHistory;
  if HaveHistory then N2.Caption := GetName(0, D, F);
  LastDir := D;
  LastFile := F;
  //MessageDlg(D+F, mtError, [mbOK], 0);
  showICO;
  N1.Enabled := APP_cfg.ReadBool('ENVIRONMENT','ENVIRONMENT_Enabled',false);

end;

procedure TMainForm.Panel3Click(Sender: TObject);
begin    //<<      //[OK]
  Panel2.Tag := 1 ;
  Timer1.Enabled := true ;
end;

procedure TMainForm.Panel7Click(Sender: TObject);
begin   //>>      //[OK]
  Panel2.Tag := 0 ;
  Timer1.Enabled := true ;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var k : integer;
begin    //[OK]
  k := Panel2.Tag;
  case k of
   1: begin
        if (Panel2.Width > 64) then
         begin
          Panel2.Width := Panel2.Width - 60 ;
         end
        else
         begin
          Panel2.Width := 2 ;
          Timer1.Enabled := false ;
         end;
      end;
   0: begin
        if (Panel2.Width < 340) then
         begin
          Panel2.Width := Panel2.Width + 60 ;
         end
        else
         begin
          Panel2.Width := 405 ;
          Timer1.Enabled := false ;
         end;
      end;
  end
end;

procedure TMainForm.X1Click(Sender: TObject);
begin   //[OK]
  close;
end;

procedure TMainForm.AboutButClick(Sender: TObject);
var AboutBox : TAboutBox ;
begin   //[OK]
   AboutBox := TAboutBox.Create(nil);
   AboutBox.ShowModal ;
   AboutBox.Free;
end;

procedure TMainForm.ListView1DblClick(Sender: TObject);
var
 s,c,CurrentDir,CurrentDir_def: string;
 i : integer;
begin   //打开文件
  if not ListViewStop then
    begin
     s := ListView1.Selected.Caption + ListView1.Selected.SubItems.Strings[0];
     Recording_Time(1);
     Memo1.Lines.Add('打开 '+ s);
     i := ExtToID(ListView1.Selected.SubItems.Strings[0]);
     //showmessage(inttostr(i));
     c := APP_cfg.ReadString('App-ID',inttostr(i),'');
     //showmessage(c);
     c := Identification(c, s);
     //showmessage(c);
     CurrentDir_def := APP_cfg.ReadString('App-ID','other_Dir',ProgramDir+'_APP\');
     CurrentDir := APP_cfg.ReadString('App-ID',GetName(5,inttostr(i),'') ,CurrentDir_def);
     CurrentDir := Identification(CurrentDir, '');
     if RunFunction(c,'',CurrentDir,0) then Memo1.Lines.Add('成功打开。')
       else Memo1.Lines.Add('不能打开。没有应用。');
    end;
end;

procedure TMainForm.GroupBox1DblClick(Sender: TObject);
begin   //[OK]   //代码操作记录清除
  Memo1.Clear;
end;

procedure TMainForm.GroupBox3DblClick(Sender: TObject);
begin   //[OK]    //库操作记录清除
  Memo2.Clear;
end;

procedure TMainForm.Bt4Click(Sender: TObject);
begin   //[OK]      //工程的文件列表全部移除
 if MessageDlg('移除工程的全部内容，文件仍保留在项目文件夹中。你要继续吗？',
    mtWarning, [mbYes, mbNo], 0) = mrYes then
   begin
     Recording_Time(1);
     ListView1.Items.Clear;
     PJ.WriteInteger('List','Count',0) ;
     Memo1.Lines.Add('移除工程的全部内容');
   end;
 Memo1.Lines.Add('');
end;

procedure TMainForm.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin   //[OK]     //代码编译进度条
//注意这里的Panels[1]指的就是第2块面板，因为默认是从0开始的
 if Panel = StatusBar.Panels[1] then
 with ProgressBar1 do
  begin
   Top := Rect.Top;
   Left := Rect.Left;
   Width := Rect.Right - Rect.Left ;//- 15;
   Height := Rect.Bottom - Rect.Top;
  end;
end;

procedure TMainForm.StatusBar2DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin   //[OK]     //库编译进度条
//注意这里的Panels[1]指的就是第2块面板，因为默认是从0开始的
 if Panel = StatusBar.Panels[1] then
 with ProgressBar2 do
  begin
   Top := Rect.Top;
   Left := Rect.Left;
   Width := Rect.Right - Rect.Left ;//- 15;
   Height := Rect.Bottom - Rect.Top;
  end;
end;

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin   //[OK]     //主菜单弹出
  PopupMenu1.Popup(MainForm.Left + ToolButton1.Left + 3,
    MainForm.Top + ToolButton1.Height + 33 );
end;

procedure TMainForm.ToolButton5Click(Sender: TObject);
begin   //[OK]     //扩展菜单弹出
  PopupMenu3.Popup(MainForm.Left + ToolButton5.Left + 3,
    MainForm.Top + ToolButton5.Height + 33 );
end;

procedure TMainForm.ToolButton21Click(Sender: TObject);
begin   //[OK]     //模拟器菜单弹出
  PopupMenu2.Popup(MainForm.Left + ToolButton21.Left + 3,
    MainForm.Top + ToolButton21.Height + 33 );
end;

procedure TMainForm.NewButClick(Sender: TObject);
var
  FnewPJ: TnewPJ; //新建工程窗口类
  key : boolean;
  oldname,newname : string;
begin    //创建工程
  Memo1.Clear;
  Memo2.Clear;
  FnewPJ:= TnewPJ.Create(Nil);
  FnewPJ._ProgramDir := ProgramDir ;
  FnewPJ.load;
  FnewPJ.ShowModal;
  key := FnewPJ._OK;
  if FnewPJ._OK then
    begin
     ProjectDir:= FnewPJ._Dir ;
     ProjectFile:= FnewPJ._File ;
     ProjectTemplate := FnewPJ._Template ;
    end;
  FnewPJ.Free;
  if key then //创建和打开工程的操作。
    begin
      //记录
      Recording_Time(1);
      Recording_Time(2);
      Memo1.Lines.Add('工程模版：'+ ProjectTemplate);
      Memo1.Lines.Add('创建路径：'+ ProjectDir );
      Memo1.Lines.Add('创建工程：'+ ProjectFile );
      if not CopyAllFile(ProjectTemplate, ProjectDir) then
         Memo1.Lines.Add('工程创建失败！')
        else
          begin
           //读项目主文件
           PJ_opened := True;
           oldname:= ProjectDir + 'project.vk5';
           newname:= ThePJFile;
           if (fileExists(oldname)) and (LowerCase(oldname) <> LowerCase(newname)) then
             begin
               DeleteFile(newname);
               RenameFile(oldname, newname);
             end;
           PJ:= TiniFile.Create(newname);
           PJ.WriteString('Project','name',ProjectFile);
           NES_Refresh;
           LIB_Refresh(true);
           HistoryBut.Enabled := false;
           Memo1.Lines.Add('工程创建完成！');
         end;
    end;
  Memo1.Lines.Add('');
end;

procedure TMainForm.Recording_Time(m : integer);
begin
  if m=1 then
    Memo1.Lines.add(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOW()))
    else
    Memo2.Lines.add(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOW()));
end;

procedure TMainForm.NES_Refresh;
var
 PJfile : Rfile;
 s : string;
 Count,i,p,j : Integer;
 Y :TListItem ;
begin    //刷新“NES代码及资源”窗口
 lostFile := false;
 ListViewStop := not PJ_opened;
 if PJ_opened then
 begin
  GroupBox2.Caption := ProjectFile;
    Count:= PJ.ReadInteger('List','Count',0);
    ListView1.Clear;
    if Count>0 then
      begin
        for i := 0 to Count-1 do
         begin
           s := PJ.ReadString('List',inttostr(i),'');
             PJfile.fname := ChangeFileExt(s,'');
             PJfile.ftype := LowerCase(ExtractFileExt(s));
             p := ExtToID(PJfile.ftype);
             Y := ListView1.Items.Add;
             Y.ImageIndex := p;
             Y.Caption := PJfile.fname;
             Y.SubItems.Add(PJfile.ftype);
            if not FileExists(ProjectDir + s) then
            begin
               Y.ImageIndex := 16;
               lostFile := true;
               MessageDlg('项目文件缺失 '+s, mtWarning, [mbOK], 0);
            end;
         end;
        if lostFile then
          begin
            if MessageDlg('自动去除缺失项？', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
              begin
                j:=0;
                for i := 0 to Count-1 do
                begin
                  s := PJ.ReadString('List',inttostr(i),'');
                  if FileExists(ProjectDir + s) then
                    begin
                      PJ.WriteString('List',inttostr(j),s);
                      inc(j);
                    end;
                end;
                PJ.WriteInteger('List','Count',j);
                NES_Refresh;
              end;
          end;
      end;
 end
 else
 begin
   GroupBox2.Caption := '你还没有打开工程';
   ListView1.Clear;
   ProjectDir:= '';
   ProjectFile:= '';
 end;
  BuildBut.Enabled := PJ_opened;
  RunBut.Enabled := PJ_opened;
  ComBut.Enabled := PJ_opened;
  Bt0.Enabled := PJ_opened;
  //Bt1.Enabled := PJ_opened;
  Bt2.Enabled := PJ_opened;
  //Bt3.Enabled := PJ_opened;
  Bt4.Enabled := PJ_opened;
  NewBut.Enabled := not PJ_opened;
  OpenBut.Enabled := not PJ_opened;
  CloseBut.Enabled := PJ_opened;
  InfoBut.Enabled := PJ_opened;
end;


procedure TMainForm.CloseButClick(Sender: TObject);
begin   //关闭项目
  
  LastDir := ProjectDir;
  LastFile := ProjectFile;

  Recording_Time(1);
  APP_cfg.WriteString('History','ProjectDir',ProjectDir);
  APP_cfg.WriteString('History','ProjectFile',ProjectFile) ;
  N2.Caption := ThePJFile;
  N2.Enabled := true;
  PJ_opened := False;
  NES_Refresh;
  LIB_Refresh(false);
  Memo1.Lines.Add('工程已关闭！');
  Memo1.Lines.Add('');
  ProjectFile := '';
  PJ.Free;
  GroupBox2.Caption := '你还没有打开工程';
  GroupBox4.Caption := '你还没有打开工程';
  HistoryBut.Enabled := true;
end;

function TMainForm.ExtToID(fExt: string):Integer;
begin     //通过文件扩展名，查图标ID
 if fExt='' then
   begin
     Result := 10;
   end
   else
   begin
       Result := APP_cfg.ReadInteger('TypeID',fExt,10);
   end;
end;

function TMainForm.ThePJFile:string;
begin
  Result := GetName(0, ProjectDir, ProjectFile);
end;

procedure TMainForm.LIB_Refresh(Mandatory : boolean);
var
   s : string;
   SearchRec:TSearchRec;
   found:integer;
   key : Boolean;
//  winexec(pansichar(ProgramDir+'test\test.bat'),SW_SHOWNORMAL);
//  WinExec_ShowModal(pansichar(ProgramDir+'test\test.bat'),SW_SHOWNORMAL);
begin
 key := False;
 if PJ_opened then
  begin
   s := ProjectDir+'*.lib';
   found:=FindFirst(s, faAnyFile, SearchRec);
   if found=0 then
    begin
     if (SearchRec.Name <> '.')  and (SearchRec.Name <> '..')
                   and    (SearchRec.Attr <> faDirectory)    then
       begin
         //s:= SearchRec.Name ;
         key := True;
       end;
    end;
  end;
 ListBox1.Clear;
 if PJ_opened and key then
   begin
    LibFile := SearchRec.Name;
    TheLibFile := ProjectDir + SearchRec.Name;
    GroupBox4.Caption := LibFile;
    if CompareNew(TheLibFile, GetName(3,'','')) or Mandatory then //Lib比lst新
       MyOperation('LibView', '', 2, 2)
     else
        Memo2.Lines.add('库的模块列表已经是最新的。');
    if FileExists(GetName(3,'','')) then
            ListBox1.Items.LoadFromFile(GetName(3,'',''));
   end
  else
    GroupBox4.Caption := '未找到库文件..\Lib\';
  But0.Enabled := key;
  //But1.Enabled := key;
  //But2.Enabled := key;
  But3.Enabled := key;
  Button1.Enabled := PJ_opened;
  if ListBox1.ItemIndex<0 then
    begin
      But1.Enabled := false;
      But2.Enabled := false;
    end;
end;

procedure TMainForm.OpenButClick(Sender: TObject);
begin   //打开工程
   Memo1.Clear;
   Memo2.Clear;
   OpenDialog1.InitialDir := ProgramDir;
   if OpenDialog1.Execute then
     begin
       ProjectDir:= ExtractFilePath(OpenDialog1.FileName) ;
       ProjectFile:= ChangeFileExt(ExtractFileName(OpenDialog1.FileName),'');
       PJ_opened := True;
       PJ:= TiniFile.Create(ThePJFile);
       Recording_Time(1);
       NES_Refresh;
       LIB_Refresh(false);
       Memo1.Lines.Add('打开项目路径：' + ProjectDir);
       Memo1.Lines.Add('打开项目名：' + ProjectFile);
       HistoryBut.Enabled := false;
       Memo1.Lines.Add('工程打开完成！');
     end;
  Memo1.Lines.Add('');
end;


procedure TMainForm.Bt2Click(Sender: TObject);
var
  Count: integer;
  fDir,fFile : string;
begin   //增加文件
 OpenDialog2.InitialDir := ProjectDir;
 if OpenDialog2.Execute then
   begin
     Recording_Time(1);
     fDir:= ExtractFilePath(OpenDialog2.FileName);
     fFile:= ExtractFileName(OpenDialog2.FileName);
     if fDir <> ProjectDir then
       begin
         Copyfile(PChar(OpenDialog2.FileName),PChar(ProjectDir + fFile),true);
         memo1.Lines.Add('复制 ' + OpenDialog2.FileName + ' 到 '+ ProjectDir);
       end;
        Count := PJ.ReadInteger('List','Count',0);
        PJ.WriteString('List',inttostr(Count),fFile);
        PJ.WriteInteger('List','Count',Count+1) ;
     memo1.Lines.add('增加文件 '+ fFile);
     NES_Refresh;
   end;
 Memo1.Lines.Add('');
end;

procedure TMainForm.Bt3Click(Sender: TObject);
var
  i,Count : integer;
  s : string;
begin   //移除文件
  Recording_Time(1);
  memo1.Lines.Add('移除文件 '+ ListView1.Items[ListView1.ItemIndex].Caption
    + ListView1.Items[ListView1.ItemIndex].SubItems[0]);
  ListView1.Items.Delete(ListView1.ItemIndex);
        Count := PJ.ReadInteger('List','Count',0)-1;
        for i := 0 to Count-1 do
         begin
           s := ListView1.Items[i].Caption + ListView1.Items[i].SubItems[0];
           PJ.WriteString('List',inttostr(i),s);
         end;
        PJ.WriteInteger('List','Count',Count) ;
  Memo1.Lines.Add('');
end;

procedure TMainForm.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
 if not ListViewStop then
  begin
    Bt1.Enabled := Selected;
    Bt3.Enabled := Selected;
  end;
end;

procedure TMainForm.ListBox1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
    begin
      But1.Enabled := true;
      But2.Enabled := true;
    end;
end;

procedure TMainForm.But0Click(Sender: TObject);
var
  fDir,fFile : string;
begin  //增加模块
  OpenDialog3.InitialDir := ProjectDir;
  if OpenDialog3.Execute then
    begin
      fDir:= ExtractFilePath(OpenDialog3.FileName);
      fFile:= ExtractFileName(OpenDialog3.FileName);
      if NoSpacenFileName(fFile) then
        begin
         Recording_Time(2);
         if fDir <> ProjectDir then
          begin
           Copyfile(PChar(OpenDialog3.FileName),PChar(ProjectDir + fFile),true);
           memo2.Lines.Add('复制 ' + OpenDialog3.FileName + ' 到 '+ ProjectDir);
          end;
         MyOperation('LibAdd', fFile,2,2);
         Lib_Refresh(true);
        end
        else
        memo2.Lines.Add('模块文件名不能含空格。增加模块操作失败。');
    end;
end;

function TMainForm.ReadFunction(var Comm : string; SelectionFile : string):boolean;
begin     //提取实现功能的批处理文件   
 if Comm = '' then Result := False
   else
   begin
       Comm := APP_cfg.ReadString('Function',Comm,'');
       Result := (Length(Comm)>0 );
       if Result then Comm := Identification(Comm, SelectionFile);
   end;
end;

function TMainForm.RunFunction(const C ,CheckFile,CurrentDir: string; Show: integer):boolean;
var
  i, j : integer;
  d : single;
  s, TheCheckFile : string;
  t : Cardinal;
begin  //运行函数功能
  ProgressBar1.Position := 0;
  ProgressBar2.Position := 0;
  i := 0;
  SetCurrentDir(CurrentDir);
  //showmessage(CurrentDir);
  //showmessage(C);
  case Show of
  0: t := WinExec(pchar( C),SW_NORMAL);
  1: t := WinExec(pchar( C),SW_NORMAL);
  2: t := WinExec(pchar( C),SW_SHOWMINIMIZED);
  else
   t := WinExec(pchar( C),SW_NORMAL);
  end;

  if t=33 then
  begin
   if (show=1) or (show=2) then
    begin
    if length(CheckFile)>0 then
     begin
      TheCheckFile := ProjectDir + CheckFile;
      while (not FileExists(TheCheckFile)) and (i<96) do
      begin
        Sleep(100);
        i := i + 3;
        ProgressBar1.Position := i;
        ProgressBar2.Position := i;
      end;
      if FileExists(TheCheckFile) then
        begin
          j := 0;
          while (IsFileInUse(TheCheckFile)) and (j<4) do
            begin
              Sleep(500);
              inc(j);
            end;
         if (IsFileInUse(TheCheckFile)) then
          begin
             showmessage(CheckFile + '文件被占用');
             if i<96 then i := 100;
          end;
        end;
     end;
      d := (i/3+1)*0.1 + j*0.5;
      s := 'Time='+ FormatFloat('0.0',d)+' s';
      StatusBar1.Panels[2].Text := s;
      StatusBar2.Panels[2].Text := s;
      Result := (i<96);
    end
    else Result := true;
  end
  else
  begin
    MessageDlg(C+chr(10)+chr(13)+'指令出错或文件不存在。', mtError, [mbOK], 0);
    Result := false;
  end;
StatusBar1.Panels[0].Text := '执行码='+inttostr(t);
StatusBar2.Panels[0].Text := '执行码='+inttostr(t);
end;

procedure TMainForm.MyOperation(const Operation, oFile: string; const ID,show : integer);
var
   f, CheckFile, CurrentDir_def, CurrentDir : string;
begin           
   f := Operation;
   if ReadFunction(f, oFile) then
      begin
       function_pass := False;
       StatusBar2.Panels[0].Text := Operation;
       StatusBar1.Panels[0].Text := Operation;
       //MessageDlg('cmd ' + f, mtWarning, [mbOK], 0);
       CheckFile := APP_cfg.ReadString('Function',GetName(4,Operation,''),'');
       CheckFile := Identification(CheckFile, oFile);
       CurrentDir_def := APP_cfg.ReadString('Function','other_Dir',ProgramDir+'_APP\');
       CurrentDir := APP_cfg.ReadString('Function',GetName(5,Operation,''),CurrentDir_def);
       CurrentDir := Identification(CurrentDir, '');
       function_pass := RunFunction(f,CheckFile,CurrentDir,show);
       case ID of
         1: begin
            if function_pass then
              begin
               if CheckFile='' then
                 memo1.Lines.Add('操作'+Operation+'结束。请确认。')
                else
                begin
                 memo1.Lines.Add('操作'+Operation+'成功！');
                 ProgressBar1.Position := 100;
                 ProgressBar2.Position := 100;
                end;
              end
            else
              memo1.Lines.Add('操作'+Operation+'失败！');
            end;
         2: begin
             if function_pass then
              begin
               if CheckFile='' then
                 memo2.Lines.Add('库操作'+Operation+'结束。请确认。')
               else
                begin
                 memo2.Lines.Add('库操作'+Operation+'成功！');
                 ProgressBar1.Position := 100;
                 ProgressBar2.Position := 100;
                end;
              end
             else
              memo2.Lines.Add('库操作'+Operation+'失败！');
            end;
       end;
      end
      else
      begin
        MessageDlg(Operation+'信息不存在', mtWarning, [mbOK], 0);
      end;
end;



procedure TMainForm.But1Click(Sender: TObject);
begin   //删除模块
  if ListBox1.ItemIndex >= 0 then
    begin
      Recording_Time(2);
      MyOperation('LibDel', ListBox1.Items[ListBox1.ItemIndex], 2,2);
      Lib_Refresh(true);
    end;
end;

procedure TMainForm.But2Click(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
    begin
      Recording_Time(2);
      MyOperation('LibGet', ListBox1.Items[ListBox1.ItemIndex],2,2);
      Lib_Refresh(false);
    end;
end;

procedure TMainForm.showICO;
var
  n,i,c : integer;
  s,k : string;
  Y :TListItem ;
begin
  ListView1.Clear;
  ListViewStop := true;
  Y := ListView1.Items.Add;
  Y.ImageIndex := -1;
  Y.Caption := '图标与序号';
  Y.SubItems.Add('类型');
       s := APP_cfg.ReadString('TypeID','TYPE','');
       k := '';
       n := length(s);
       s := s+'.';
       i := 1;
       while (i<=n) do
       begin
         k:= k + s[i];
         inc(i);
         if s[i]='.' then
           begin
             c := ExtToID(k);
             Y := ListView1.Items.Add;
             Y.ImageIndex := c;
             Y.Caption := inttostr(c);
             Y.SubItems.Add(k);
             k := '';
           end;
       end;
end;

procedure TMainForm.But3Click(Sender: TObject);
begin   //打开Lib.lst文件
     Recording_Time(2);
     Memo2.Lines.Add('打开 Lib.lst');
     MyOperation('ListView', 'Lib.lst', 2,0);
end;

procedure TMainForm.InfoButClick(Sender: TObject);
var
  p,c : string;
  t : Cardinal;
begin
  p := '"'+GetName(2,'','')+ '"';
  c := '"'+ThePJFile+'"';
  t := WinExec(pchar(p+' '+ c),SW_NORMAL);
  StatusBar1.Panels[0].Text := '执行码='+inttostr(t);
  StatusBar2.Panels[0].Text := '执行码='+inttostr(t);
end;

procedure TMainForm.Bt0Click(Sender: TObject);
var
 From : TnewCode;
 fFile, s, s1, oldname : string;
 new_one : Boolean;
 Count, j : Integer;
 F: FIle of Byte;
begin  //新建代码和资源
   From:= TnewCode.Create(Nil);
    try
     From.myini := @APP_cfg;
     //From.iniFile := GetName(1,'','');
     From.ProgramDir := ProgramDir;
     From.load;
     From.ShowModal;
     new_one := From.mOK;
     j := From.mNo;
     fFile := From.mName;
    finally
     From.Free;
    end;
   if new_one then
    begin
     Recording_Time(1);
       Count := PJ.ReadInteger('List','Count',0);
       PJ.WriteString('List',inttostr(Count),fFile);
       PJ.WriteInteger('List','Count',Count+1) ;
     memo1.Lines.add('新建文件 '+ fFile);
     s1 := LowerCase(ExtractFileExt(fFile)) ;
     s := APP_cfg.ReadString('NewCode','temp'+inttostr(j),'');
     if length(s)>0 then
       begin
         //showmessage(ProgramDir+'_FileCreat\_'+s+'\');
         if not CopyAllFile(ProgramDir+'_FileCreat\_'+s+'\', ProjectDir) then
              Memo1.Lines.Add('文件创建模版掉失！')
           else
             begin
              oldname := ProjectDir+s+s1;
              //showmessage(oldname);
              if (fileExists(oldname)) then
               begin
               RenameFile(oldname, ProjectDir+fFile);
               end;
             end;
       end
       else
       begin
         AssignFile( F, ProjectDir + fFile );
         Rewrite(F);
         CloseFile(F);
       end;

     NES_Refresh;
     if not lostFile then
      begin
        ListView1.ItemIndex := ListView1.Items.Count-1;
        //打开文件
        ListView1DblClick(self);
      end;
    end
    else
     memo1.Lines.add('新建文件失败。');
   Memo1.Lines.Add('');
end;

procedure TMainForm.ListView1Click(Sender: TObject);
var
 i: Integer;
 s, s2: string;
begin
  //StatusBar1.Panels[2].Text := IntToStr(ListView1.ItemIndex);
 if not ListViewStop then
  begin
  i := ListView1.ItemIndex;
  if i >= 0 then
    begin
      s := lowerCase(ListView1.Items[i].SubItems[0]);
      s2 := APP_cfg.ReadString('ButtonEnable','CompileButton_Enabled_str','.c');
      CompileBut.Enabled := ( s = s2 );
    end
    else
    begin
      CompileBut.Enabled := False ;
    end;
  end;
end;

procedure TMainForm.CompileButClick(Sender: TObject);
var s : string;
begin // 将C代码编译成s代码
   Recording_Time(1);
   s := ListView1.Selected.Caption + ListView1.Selected.SubItems.Strings[0];
   MyOperation('Compile', s, 1,2);
end;

procedure TMainForm.BuildButClick(Sender: TObject);
begin  //编译整个工程，运行 make.cmd或make.bat
  Recording_Time(1);
  MyOperation('Build', '', 1,1);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PJ_opened then
    begin
     APP_cfg.WriteString('History','ProjectDir',ProjectDir);
     APP_cfg.WriteString('History','ProjectFile',ProjectFile) ;
     PJ.Free ;
    end;
  APP_cfg.Free;
end;

function TMainForm.Identification(const Comm, SelectionFile : string):string;
var s : string;
begin
  if length(Comm)>0 then
    begin
     s := Comm;
     s := AnsiReplaceText(s,'{\}',ProgramDir);
     s := AnsiReplaceText(s,'[\]',ProjectDir);
     s := AnsiReplaceText(s,'[]',ChangeFileExt(ProjectFile,''));
     s := AnsiReplaceText(s,'<>',ChangeFileExt(SelectionFile,''));
     s := AnsiReplaceText(s,'<.>',SelectionFile);
     //s := AnsiReplaceText(s,'[b]',TheLibFile);
     s := AnsiReplaceText(s,'[b]',LibFile);
     Result := s;
    end
    else
    Result := Comm;
end;

procedure TMainForm.RunButClick(Sender: TObject);
begin
  Recording_Time(1);
  MyOperation('Run', '', 1,0);
end;

procedure TMainForm.ComButClick(Sender: TObject);
var t : Cardinal;
begin //打开项目根目录的命令行窗口
 SetCurrentDir(ProjectDir);
 t := WinExec('cmd' ,SW_NORMAL);
 StatusBar1.Panels[0].Text := '执行码='+inttostr(t);
 StatusBar2.Panels[0].Text := '执行码='+inttostr(t);
end;

procedure TMainForm.HistoryButClick(Sender: TObject);
begin //打开最近的工程
   Memo1.Clear;
   Memo2.Clear;
   if FileExists(GetName(0, LastDir, LastFile)) then
     begin
       ProjectDir := LastDir ;
       ProjectFile:= LastFile ;
       PJ_opened := True;
       PJ:= TiniFile.Create(ThePJFile);
       Recording_Time(1);
       NES_Refresh;
       LIB_Refresh(false);
       Memo1.Lines.Add('打开项目路径：' + ProjectDir);
       Memo1.Lines.Add('打开项目名：' + ProjectFile);
       Memo1.Lines.Add('工程打开完成！');
     end
     else
      Memo1.Lines.Add('历史工程不存在！');
  Memo1.Lines.Add('');
  HistoryBut.Enabled := false;
end;

function TMainForm.GetName(const ID:integer;const D,F : string):string;
begin
  case ID of
  0: Result := D + F + '.vk5';
  1: Result := ProgramDir + 'FC_maker_cfg.ini';
  2: Result := ProgramDir + 'NESInfo.exe';
  3: Result := ProjectDir + 'Lib.lst';
  4: Result := D + '_check';
  5: Result := D + '_Dir' ;
  end;
end;


procedure TMainForm.N1Click(Sender: TObject);
var
  Fenv : TFormENVIRONMENT;
  Count, i: integer;
  strName, strKey, strDef , s: string;
begin
  Fenv := TFormENVIRONMENT.Create(Nil);
  Count := APP_cfg.ReadInteger('ENVIRONMENT','Count',0);
  for i := 0 to Count-1 do
   begin
     strName := APP_cfg.ReadString('ENVIRONMENT',inttostr(i),'');
     strKey := APP_cfg.ReadString('ENVIRONMENT','Key' + inttostr(i),'');
     s := APP_cfg.ReadString('ENVIRONMENT','Def' + inttostr(i),'');
     strDef := Identification(s, '');
     Fenv.load(i, strName, strKey, strDef);
   end;
  SetCurrentDir(ProgramDir);
  Fenv.ShowModal;
  Fenv.Free;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
   MyOperation('LibView', '', 2, 2);
   if FileExists(GetName(3,'','')) then
            ListBox1.Items.LoadFromFile(GetName(3,'',''));
end;

procedure TMainForm.N2Click(Sender: TObject);
var
  D,F : string;
  b : boolean;
begin
  b := PJ_opened;
  if PJ_opened then
   begin
     D := ProjectDir;
     F := ProjectFile;
     APP_cfg.WriteString('History','ProjectDir',ProjectDir);
     APP_cfg.WriteString('History','ProjectFile',ProjectFile) ;
     N2.Caption := ThePJFile;
     PJ_opened := False;
     NES_Refresh;
     LIB_Refresh(false);
     ProjectFile := '';
     PJ.Free;
   end;
  HistoryButClick(self);
  if b then
    begin
     LastDir := D;
     LastFile := F;
    end;
end;

//delphi 检测文件是否被占用
function IsFileInUse(AName: string): boolean;
var
  hFileRes: HFILE;
begin
  Result := False;
  if not FileExists(AName) then exit;
  try
    hFileRes := CreateFile(PChar(AName), GENERIC_READ or GENERIC_WRITE, 0,
                                nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  finally
    Result := (hFileRes = INVALID_HANDLE_VALUE);
    if not Result then CloseHandle(hFileRes);
  end;
end; 

end.
