within Delays.Examples;
model IntegerDelays "Example of delaying Integer signals"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.IntegerTable integerSource(table={{0.01*(i - 1),i}
        for i in 1:100})
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Delays.Blocks.Logical.IntegerDelay integerDelay(t=0.1111111)
    annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
  Delays.Blocks.Logical.IntegerTransportDelay integerTransportDelay(distance=
        0.05) annotation (Placement(transformation(extent={{-4,-42},{16,-22}})));
  Modelica.Blocks.Sources.Sine sine(freqHz=5, offset=1)
    annotation (Placement(transformation(extent={{-54,-64},{-34,-44}})));
equation
  connect(sine.y, integerTransportDelay.v) annotation (Line(points={{-33,-54},{
          6,-54},{6,-42},{6,-42}}, color={0,0,127}));
  connect(integerSource.y, integerDelay.u) annotation (Line(points={{-39,0},{-24,
          0},{-24,0},{-8,0}}, color={255,127,0}));
  connect(integerSource.y, integerTransportDelay.u) annotation (Line(points={{-39,
          0},{-28,0},{-28,-32},{-8,-32}}, color={255,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IntegerDelays;
