within Delays.Internal.Functions.Booleans;
function push
  extends Modelica.Icons.Function;
  input Types.BooleanDelayer delayer;
  input Boolean value;
  input Real x=0;
  output Integer size;
external"C" size = Delays_BooleanDelayer_push(
    delayer,
    value,
    x) annotation (Include="#include \"modelica_delays.c\"");
end push;
