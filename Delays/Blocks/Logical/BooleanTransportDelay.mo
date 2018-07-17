within Delays.Blocks.Logical;
block BooleanTransportDelay
  "Delay a Boolean signal with a transport delay"
  extends Modelica.Blocks.Interfaces.partialBooleanSISO;
  parameter Real distance=1;
  Modelica.Blocks.Interfaces.RealInput v annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-100})));
  Integer size(start=0);
protected
  final parameter Internal.Types.BooleanDelayer delayer=
      Internal.Types.BooleanDelayer(getInstanceName());
  Real x(start=0, fixed=true);
  Real xNext;
equation
  der(x) = max(0, v);
  xNext = Internal.Functions.Booleans.transport(delayer, x);
algorithm
  when {change(u),xNext >= distance} then
    if change(u) then
      size := Internal.Functions.Booleans.push(
        delayer,
        u,
        time);
    end if;
    if xNext >= distance then
      (y,size) := Internal.Functions.Booleans.pop(delayer);
    end if;
  end when;
  annotation (Icon(graphics={
        Line(points={{-80,-66},{-68,-66},{-68,-22},{-48,-22},{-48,-66},{-48,-66}}),
        Line(points={{-16,-66},{-4,-66},{-4,-22},{16,-22},{16,-66},{16,-66}}),
        Line(points={{-48,-66},{-36,-66},{-36,-22},{-16,-22},{-16,-66},{-16,-66}}),
        Line(points={{16,-66},{28,-66},{64,-66},{58,-66},{48,-66},{48,-66}}),
        Line(points={{34,32},{46,32},{46,76},{66,76},{66,32},{66,32}}, color={255,
              0,255}),
        Line(points={{-30,32},{-18,32},{-18,76},{2,76},{2,32},{2,32}}, color={255,
              0,255}),
        Line(points={{2,32},{14,32},{14,76},{34,76},{34,32},{34,32}}, color={255,
              0,255}),
        Line(points={{-78,32},{-66,32},{-30,32},{-36,32},{-46,32},{-46,32}},
            color={255,0,255})}));
end BooleanTransportDelay;
