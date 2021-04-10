program Area;
uses Crt;
const FeetPerYard = 3;
var CircleArea,RadiusInFeet,RadiusInYards:real;
begin
   ClrScr;
   RadiusInYards:=10.0;
   RadiusInFeet:=RadiusInYards*FeetPerYard;
   CircleArea:=Pi*RadiusInFeet*RadiusInFeet;
   writeln('The area square feet is:',CircleArea:10:4);
   readln;
end.