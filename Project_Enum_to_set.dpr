{$APPTYPE CONSOLE}
program Project_Enum_to_set;

uses
  System.SysUtils,
  System.StrUtils,
  System.Generics.Collections,
  System.Rtti,
  UTuple_utils;

  type
      TMyEnum = (a,b,c,d,e,f,g,h,i,j);

      TCompilerVersion = set of char ;


  function StringToCompilerVersions(const value : string) : TCompilerVersion;
    var
        ch     :  char;
  begin
        result := [];

    var entries:= SplitString(value, ',');

    var ranges := Str.map<Tupcc>( entries, Str_range_to_tuple );

    for var x  := low(TMyEnum) to high(TMyEnum) do begin

            ch := tvalue.From<TMyEnum>(x).ToString[1];

            if Included( ch, ranges) then include(result, ansichar(ch) );
    end;

  end;


begin
        var x  := StringToCompilerVersions( 'a-d,f, g-i' );

    for var z in x do write(z,' '); writeln;

    readln;

end.





