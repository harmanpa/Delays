within Delays.Internal.Functions.Booleans;
function dtransport
  extends Modelica.Icons.Function;
  input Types.BooleanDelayer delayer;
  input Real x;
  input Real dx;
  output Real dxNext;
algorithm
  dxNext := dx;
end dtransport;
