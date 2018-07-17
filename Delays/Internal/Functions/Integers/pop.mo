within Delays.Internal.Functions.Integers;
function pop
  extends Modelica.Icons.Function;
  input Types.IntegerDelayer delayer;
  output Integer value;
  output Integer size;
  output Integer iteration;
external"C" value = Delays_IntegerDelayer_pop(
    delayer,
    size,
    iteration) annotation (Include="#include \"modelica_delays.c\"");
end pop;
