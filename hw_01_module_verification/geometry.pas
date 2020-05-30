unit Geometry;


interface

uses Math;

type

  Point = record
    x, y : Real;
  end;

  Triangle = record
    A, B, C : Point;
  end;

  Line = record
    Q, S : Point;
  end;


function CreatePoint() : Point;
function CreateTriangle() : Triangle;
function CreateLine() : Line;

function GetDistance(n, f : Point) : Real;
function GetTrPer(T : Triangle) : Real;
function GetTrSqr(T : Triangle) : Real;

procedure TrPerAndSide(T : Triangle; out AB, BC, AC : Real; out P : Real);

function CrossLineTest(P1, P2, P3, P4 : Point) : Boolean;
function CrossLineAndTr(T : Triangle; L : Line) : Boolean;

function GetMaxAngle(T: Triangle): Real;


implementation

function CreatePoint() : Point;
begin
   Write('Enter Point : ');
   Read(CreatePoint.x);
   Readln(CreatePoint.y);
end;


function GetDistance(n, f : Point) : Real;
begin
  GetDistance := sqrt(sqr(n.x - f.x) + sqr(f.y - n.y));
end;


function CreateTriangle() : Triangle;
begin
  CreateTriangle.A := CreatePoint;
  CreateTriangle.B := CreatePoint;
  CreateTriangle.C := CreatePoint;
end;


function CreateLine() : Line;
begin
   Write('Enter Line : ');
   WriteLn('Point Q: ');
   ReadLn(CreateLine.Q.x, CreateLine.Q.y);
   WriteLn('Point S: ');
   ReadLn(CreateLine.S.x, CreateLine.S.y);
end;

function GetTrPer(T : Triangle) : Real;
begin
  GetTrPer := GetDistance(T.A, T.B) + GetDistance(T.B, T.C) + GetDistance(T.A, T.C);
end;


function GetTrSqr(T : Triangle) : Real;
var
  AB, BC, AC, P, p0 : Real;
begin
  TrPerAndSide(T, AB, BC, AC, P);
  p0 := P/2;
  GetTrSqr := sqrt(p0 * (p0 - AB) * (p0 - BC) * (p0 - AC));
end;


procedure TrPerAndSide(T : Triangle; out AB, BC, AC : Real; out P : Real);
begin
  AB := GetDistance(T.A, T.B);
  BC := GetDistance(T.B, T.C);
  AC := GetDistance(T.A, T.C);
  P := GetTrPer(T);
end;

function CrossLineTest(P1, P2, P3, P4 : Point) : Boolean;
var
  W : Real;
  V : Real;
begin

  W := ((P1.x-P3.x)*(P3.y-P4.y)-(P1.y-P3.y)*(P3.x-P4.x));
  V := ((P1.x-P2.x)*(P3.y-P4.y)-(P1.y-P2.y)*(P3.x-P4.x));

  if ((W > 0.0) and (V < 0.0)) then
    exit(true);
  if ((W < 0.0) and (V > 0.0)) then
    exit(true);

  exit(false);
end;


function CrossLineAndTr(T : Triangle; L : Line) : Boolean;
begin
  if (CrossLineTest(T.A, T.B, L.Q, L.S)) then
    exit(true);
  if (CrossLineTest(T.B, T.C, L.Q, L.S)) then
    exit(true);
  if (CrossLineTest(T.A, T.C, L.Q, L.S)) then
    exit(true);

  exit(false);
end;

function GetMaxAngle(T: Triangle): Real;

var AB, BC, AC : Extended;
    AngleA, AngleB, AngleC : Extended;

begin

   AB := GetDistance(T.A, T.B);
   BC := GetDistance(T.B, T.C);
   AC := GetDistance(T.A, T.C);

   AngleA:= ArcCos((sqr(BC) + sqr(AB) - sqr (AB))/(2*BC*AC));
   AngleB:= ArcCos((sqr(AB) + sqr(AC) - sqr (BC))/(2*AB*AC));
   AngleC:= ArcCos((sqr(AB) + sqr(BC) - sqr (AC))/(2*AB*BC));

   AngleA := AngleA*0.017453;
   AngleB := AngleB*0.017453;
   AngleC := AngleC*0.017453;

  if ((AngleA)>=(AngleB)) and ((AngleA)>=(AngleC)) then
    exit (AngleA);
  if ((AngleB)>=(AngleA)) and ((AngleB)>=(AngleC)) then
    exit (AngleB);
  if ((AngleC)>=(AngleA)) and ((AngleC)>=(AngleB)) then
    exit (AngleC);

  exit (AngleA);

end;


end.
