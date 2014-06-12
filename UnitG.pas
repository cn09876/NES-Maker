unit UnitG;

interface
  uses Windows, Classes, SysUtils, Dialogs, Controls ;

  Function WinExec_ShowModal(lpCmdLine:PAnsiChar; uCmdShow:Cardinal):Cardinal;
  procedure SearchAllFile(Dir:string; var Files :TStringList);
  procedure SearchAllDirectory(Dir:string; var Directorys :TStringList);
  Function CopyAllFile(SourceDir,TargetDir:string):boolean;
  function IsValidFileName(const FileName: string): boolean;
  function CovFileDate(Fd: TFileTime): TDateTime;
  function NoSpacenFileName(name: string): boolean;
  function CompareNew(const f1,f2 : string):boolean;
  procedure NewFile(const f : string);

implementation

Function WinExec_ShowModal(lpCmdLine:PAnsiChar; uCmdShow:Cardinal):Cardinal;
//一个等待Winexec执行完成后再继续执行后面代码的函数
//lpCmdLine 要执行的命令
//uCmdShow 是否显示窗口
    { uCmdShow
     SW_HIDE = 0;    //隐藏DOS窗口
     SW_SHOWNORMAL = 1;   //显示DOS窗口
    }
var
    StartupInfo : TStartupInfo;
    ProcessInfo : TProcessInformation;
begin
    FillChar( StartUpInfo, SizeOf(StartUpInfo), $00 );
    StartUpInfo.dwFlags := STARTF_USESHOWWINDOW;
    StartUpInfo.wShowWindow := word(uCmdShow);
    if CreateProcess( nil, lpCmdLine, nil, nil, {运行批处理文件}
    False, IDLE_PRIORITY_CLASS, nil, nil, StartUpInfo,
    ProcessInfo ) then
      begin
        WaitForSingleObject(Processinfo.hProcess,INFINITE);
        GetExitCodeProcess(ProcessInfo.hProcess,Result);

        CloseHandle( ProcessInfo.hThread );
        CloseHandle( ProcessInfo.hProcess );
      end
    else
    Result := 0;
end;

procedure SearchAllFile(Dir:string; var Files :TStringList);
var
   s : string;
   SearchRec:TSearchRec;
   found:integer;
begin   //搜索全部文件
  s := Dir+'*.*';
  found:=FindFirst(s, faAnyFile, SearchRec);
       while    found=0    do
         begin
             if (SearchRec.Name <> '.')  and (SearchRec.Name <> '..')
                   and    (SearchRec.Attr <> faDirectory)    then
                 Files.Add(SearchRec.Name);
             found := FindNext(SearchRec);
         end;
       FindClose(SearchRec);
end;

procedure SearchAllDirectory(Dir:string; var Directorys :TStringList);
var
   s : string;
   SearchRec:TSearchRec;
   found:integer;
begin   //搜索全部文件
  s := Dir+'*.*';
  found:=FindFirst(s, faAnyFile, SearchRec);
       while    found=0    do
         begin
             if (SearchRec.Name <> '.')  and (SearchRec.Name <> '..')
                   and    (SearchRec.Attr = faDirectory)    then
                 Directorys.Add(SearchRec.Name + '\');
             found := FindNext(SearchRec);
         end;
       FindClose(SearchRec);
end;

Function CopyAllFile(SourceDir,TargetDir:string):boolean;
var
   f:TStringList;
   i,n:integer;
   //strDir : string;
begin
  Result := False;
  f := TStringList.Create;
  SearchAllFile(SourceDir,f);
  //MessageDlg('找到' + IntToStr(f.Count)+'个文件', mtWarning, [mbOK], 0);
  if f.Count > 0 then
    begin
      n := f.Count-1;
      if not DirectoryExists(TargetDir) then MkDir(TargetDir);
      for i := 0 to n do
       begin
//        MessageDlg('S=' + SourceDir + f[i], mtWarning, [mbOK], 0);
//        MessageDlg('T=' + TargetDir + f[i], mtWarning, [mbOK], 0);
        //strDir :=
        if Copyfile(PChar(SourceDir + f[i]),PChar(TargetDir + f[i]),true) then
          Result := True
          else
          begin  //copy失败
           if FileExists(TargetDir + f[i]) then  //目标文件存在
              begin
                if MessageDlg(TargetDir + f[i]
                 + '已存在，需要覆盖目标文件。本操作不可撤销。你要继续吗？',
                      mtWarning, [mbYes, mbNo], 0) = mrYes then
                   begin
                     Copyfile(PChar(SourceDir + f[i]),PChar(TargetDir + f[i]),
                       false);
                     Result := True;
                   end
                 else
                   break; //取消操作
              end
            else
              begin
                showmessage('copy失败 '+ TargetDir + f[i] + '  全部取消。');
                break;  //未知错误
              end;
              
          end;
       end;
    end;
  f.Free;
end;

function IsValidFileName(const FileName: string): boolean;
 const
  InValidChar: array[0..8] of char = ('\', '/', ':', '*', '?', '"', '<', '>', '|');
 var
  i: integer;
begin
 result:=length(FileName) <= MAX_PATH;
 if not Result then exit;
 for i := low(InValidChar) to high(InValidChar) do
 begin
  result := pos(InValidChar[i], FileName) = 0;
  if not Result then break;
 end;
end;

function CovFileDate(Fd: TFileTime): TDateTime;
{ 转换文件的时间格式 }
var
Tct: TSystemTime;
Temp: TFileTime;
begin
FileTimeToLocalFileTime(Fd,Temp);
FileTimeToSystemTime(Temp,Tct);
Result :=SystemTimeToDateTime(Tct);
end;

function NoSpacenFileName(name: string): boolean;
var
  Count,i : integer;
begin
  Count := length(name);
  i := 0  ;
  while (i <= Count-1) and (name[i]<>' ') do inc(i);
  Result := (not (i <= Count-1));
end;

function CompareNew(const f1,f2 : string):boolean;
var
  v1,v2: TSearchRec;
  i1,i2: TDateTime;
begin
    if FindFirst(f1, faAnyFile, v1) = 0 then
      i1 := CovFileDate(v1.FindData.ftLastWriteTime) else i1 := 0;
    if FindFirst(f2, faAnyFile, v2) = 0 then
      i2 := CovFileDate(v2.FindData.ftLastWriteTime) else i2 := 0;
    Result := (i1>i2);
end;

procedure NewFile(const f : string);
begin //

end;


end.
 