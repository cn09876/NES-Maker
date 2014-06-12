@Echo off
Echo %1 是软件根目录
Echo %2 是输出的文件名*.s
Echo %3 是选定的文件名*.c

set myDir=%1
set myDir=%myDir:"=%

set CC65_HOME=%myDir%_APP\_cc65
set Path=%myDir%_APP\_cc65\bin

echo on
cc65.exe -t nes -o %2 -I "%CC65_HOME%\include" %3
