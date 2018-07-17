within Delays.Internal.Functions.Integers;
function transport
  "Transports all inputs to overall x, returns relative x for next to pop"
  extends Modelica.Icons.Function;
  input Types.IntegerDelayer delayer;
  input Real x;
  output Real xNext;
external"C" xNext = Delays_IntegerDelayer_transport(delayer, x)
    annotation (Include="#include \"modelica_delays.c\"");
  annotation (derivative(noDerivative=delayer) = dtransport);
end transport;
