program project1;

uses Geometry;

var
  Tr : Triangle;
  L : Line;

begin


  WriteLn('Triangle:');
  WriteLn('Enter the coordinates of point A: ');
  ReadLn(Tr.A.x, Tr.A.y);
  WriteLn('Enter the coordinates of point B: ');
  ReadLn(Tr.B.x, Tr.B.y);
  WriteLn('Enter the coordinates of point C: ');
  ReadLn(Tr.C.x, Tr.C.y);

  WriteLn('Line:');
  WriteLn('Enter the coordinates of point Q: ');
  ReadLn(L.Q.x, L.S.y);
  WriteLn('Enter the coordinates of point S: ');
  ReadLn(L.S.x, L.S.y);


  WriteLn('AB = ', GetDistance(Tr.A, Tr.B):0:6);
  WriteLn('BC = ', GetDistance(Tr.B, Tr.C):0:6);
  WriteLn('AC = ', GetDistance(Tr.A, Tr.C):0:6);

  WriteLn('Per = ', GetTrPer(Tr):0:6);
  WriteLn('Sqr = ', GetTrSqr(Tr):0:6);

  WriteLn('Cross = ', CrossLineAndTr(Tr, L));

  WriteLn('MaxAngle=',GetMaxAngle(Tr));

  ReadLn();
end.
