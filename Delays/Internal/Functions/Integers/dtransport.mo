within Delays.Internal.Functions.Integers;
function dtransport
  extends Modelica.Icons.Function;
  input Types.IntegerDelayer delayer;
  input Real x;
  input Real dx;
  output Real dxNext;
algorithm
  dxNext := dx;
end dtransport;
