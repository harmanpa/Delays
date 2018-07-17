within Delays.Internal.Types;
class BooleanDelayer "Delayer external object for Booleans"
  extends ExternalObject;
  function constructor
    input String name;
    output BooleanDelayer delayer;
  external"C" delayer = Delays_BooleanDelayer_construct()
      annotation (Include="#include \"modelica_delays.c\"");
  end constructor;

  function destructor
    input BooleanDelayer delayer;
  external"C" Delays_BooleanDelayer_destruct(delayer)
      annotation (Include="#include \"modelica_delays.c\"");
  end destructor;

  annotation (Icon(graphics={Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={255,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end BooleanDelayer;
