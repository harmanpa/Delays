within Delays.Internal.Types;
class IntegerDelayer "Delayer external object for Integers"
  extends ExternalObject;
  function constructor
    input String name;
    output IntegerDelayer delayer;
  external"C" delayer = Delays_IntegerDelayer_construct()
      annotation (Include="#include \"modelica_delays.c\"");
  end constructor;

  function destructor
    input IntegerDelayer delayer;
  external"C" Delays_IntegerDelayer_destruct(delayer)
      annotation (Include="#include \"modelica_delays.c\"");
  end destructor;

  annotation (Icon(graphics={Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={255,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end IntegerDelayer;
