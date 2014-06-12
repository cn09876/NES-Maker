#include <conio.h>

void main()
{
  int var1 =1;
  int t =1;
  while (var1<20)
  {
  gotoxy(var1,10);
  cprintf("0123456789:;");
  gotoxy(var1,11);
  cprintf("@ABCDEFGHIJK");
  var1 = var1 +1;
    t=1;
    while(t++<800);
  }
  while(1);
 }
