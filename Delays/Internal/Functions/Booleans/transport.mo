within Delays.Internal.Functions.Booleans;
function transport
  "Transports all inputs to overall x, returns relative x for next to pop"
  extends Modelica.Icons.Function;
  input Types.BooleanDelayer delayer;
  input Real x;
  output Real xNext;
external"C" xNext = Delays_BooleanDelayer_transport(delayer, x)
    annotation (Include="#include \"modelica_delays.c\"");
  annotation (derivative(noDerivative=delayer) = dtransport);
end transport;
