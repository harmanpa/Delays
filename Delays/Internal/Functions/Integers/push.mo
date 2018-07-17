within Delays.Internal.Functions.Integers;
function push
  extends Modelica.Icons.Function;
  input Types.IntegerDelayer delayer;
  input Integer value;
  input Real x=0;
  output Integer size;
external"C" size = Delays_IntegerDelayer_push(
    delayer,
    value,
    x) annotation (Include="#include \"modelica_delays.c\"");
end push;
