within Delays.Examples;
model BooleanDelays "Example of delaying Boolean signals"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=0.01)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Delays.Blocks.Logical.BooleanDelay booleanDelay(t=0.1111111)
    annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
  Delays.Blocks.Logical.BooleanTransportDelay booleanTransportDelay(distance=
        0.05) annotation (Placement(transformation(extent={{-4,-42},{16,-22}})));
  Modelica.Blocks.Sources.Sine sine(freqHz=5, offset=1)
    annotation (Placement(transformation(extent={{-54,-64},{-34,-44}})));
equation
  connect(booleanPulse.y, booleanDelay.u)
    annotation (Line(points={{-39,0},{-6,0}}, color={255,0,255}));
  connect(booleanPulse.y, booleanTransportDelay.u) annotation (Line(points={{-39,
          0},{-24,0},{-24,-32},{-6,-32}}, color={255,0,255}));
  connect(sine.y, booleanTransportDelay.v) annotation (Line(points={{-33,-54},{
          6,-54},{6,-42},{6,-42}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end BooleanDelays;
