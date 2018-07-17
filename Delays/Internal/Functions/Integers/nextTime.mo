within Delays.Internal.Functions.Integers;
function nextTime "Returns exit time for next to pop"
  extends Modelica.Icons.Function;
  input Types.IntegerDelayer delayer;
  input Modelica.SIunits.Time tDelay;
  output Modelica.SIunits.Time tNext;
external"C" tNext = Delays_IntegerDelayer_nextTime(delayer, tDelay)
    annotation (Include="#include \"modelica_delays.c\"");
end nextTime;
