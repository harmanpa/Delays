within Delays.Internal.Functions.Booleans;
function pop
  extends Modelica.Icons.Function;
  input Types.BooleanDelayer delayer;
  output Boolean value;
  output Integer size;
external"C" value = Delays_BooleanDelayer_pop(delayer, size)
    annotation (Include="#include \"modelica_delays.c\"");
end pop;
