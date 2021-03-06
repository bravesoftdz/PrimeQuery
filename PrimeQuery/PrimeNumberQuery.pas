﻿namespace PrimeQuery;

interface

type
  PrimeNumberQuery = public class
  protected
    method GetAsString: String;
    method SetAsString(NumStr: String);
  public
    class method IsPrime(const TestNumber: Integer): Boolean;
    method Clear;
    method Backspace;
    method Check: Boolean;
    property Number: Integer read write;
    property AsString: String read GetAsString write SetAsString;
  end;

implementation

class method PrimeNumberQuery.IsPrime(const TestNumber: Integer): Boolean;
var 
  i: Integer := 3;
  max: Integer := Integer(Math.Round(Math.Sqrt(Double(TestNumber))));
begin
  if TestNumber = 2 then
    Result := True
  else if (TestNumber < 2) or (TestNumber mod 2 = 0) then
    Result := False
  else begin
    Result := True;
    while i < max do
      if TestNumber mod i = 0 then begin
        Result := False;
        Break;
      end else
        i := i + 2;
  end;
end;

method PrimeNumberQuery.Clear;
begin
  Number := 0;
end;

method PrimeNumberQuery.Backspace;
begin
  if Number > 0 then
    SetAsString(Number.ToString.Substring(0, Number.ToString.Length - 2).ToString)
  else
    Number := 0;
end;

method PrimeNumberQuery.Check: Boolean;
begin
  Result := IsPrime(Number) ;
end;

method PrimeNumberQuery.GetAsString: String;
begin
  Result := Number.ToString;
end;

method PrimeNumberQuery.SetAsString(NumStr: String);
begin
  Integer.TryParse(NumStr, out Number);
end;

end.
