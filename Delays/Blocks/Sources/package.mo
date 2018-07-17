within Delays.Blocks;
package Sources "Source blocks useful for discrete delays"
extends Modelica.Icons.Package;

  block IntegerPulse "Generate pulse signal of type Integer"
  parameter Integer magnitude=1;
  parameter Real width(
    final min=Modelica.Constants.small,
    final max=100) = 50 "Width of pulse in % of period";
  parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small,
      start=1) "Time for one period";
  parameter Modelica.SIunits.Time startTime=0 "Time instant of first pulse";
  extends Modelica.Blocks.Interfaces.IntegerSO;

protected
  parameter Modelica.SIunits.Time Twidth=period*width/100 "width of one pulse"
    annotation (HideResult=true);
  discrete Modelica.SIunits.Time pulsStart "Start time of pulse"
    annotation (HideResult=true);
  initial equation
  pulsStart = startTime;
  equation
  when sample(startTime, period) then
    pulsStart = time;
  end when;
  y = if time >= pulsStart and time < pulsStart + Twidth then magnitude else 0;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Text(
            extent={{-150,-140},{150,-110}},
            lineColor={0,0,0},
            textString="%period"),Line(points={{-80,-70},{-40,-70},{-40,44},{0,
          44},{0,-70},{40,-70},{40,44},{79,44}})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Text(
            extent={{-60,-74},{-19,-82}},
            lineColor={0,0,0},
            textString="startTime"),Line(
            points={{-78,-70},{-40,-70},{-40,20},{20,20},{20,-70},{50,-70},{50,
            20},{100,20}},
            color={0,0,255},
            thickness=0.5),Line(points={{-40,61},{-40,21}}, color={95,95,95}),
          Line(points={{20,44},{20,20}}, color={95,95,95}),Line(points={{50,58},
          {50,20}}, color={95,95,95}),Line(points={{-40,53},{50,53}}, color={95,
          95,95}),Line(points={{-40,35},{20,35}}, color={95,95,95}),Text(
            extent={{-30,65},{16,55}},
            lineColor={0,0,0},
            textString="period"),Text(
            extent={{-33,47},{14,37}},
            lineColor={0,0,0},
            textString="width"),Line(points={{-70,20},{-41,20}}, color={95,95,
          95}),Polygon(
            points={{-40,35},{-31,37},{-31,33},{-40,35}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),Polygon(
            points={{20,35},{12,37},{12,33},{20,35}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),Polygon(
            points={{-40,53},{-31,55},{-31,51},{-40,53}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),Polygon(
            points={{50,53},{42,55},{42,51},{50,53}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),Text(
            extent={{-95,26},{-66,17}},
            lineColor={0,0,0},
            textString="true"),Text(
            extent={{-96,-60},{-75,-69}},
            lineColor={0,0,0},
            textString="false")}),
    Documentation(info="<html>
<p>
The Boolean output y is a pulse signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Pulse.png\"
     alt=\"Pulse.png\">
</p>
</html>"));
  end IntegerPulse;

annotation (Icon(graphics={Polygon(
        origin={23.3333,0.0},
        fillColor={128,128,128},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{-23.333,30.0},{46.667,0.0},{-23.333,-30.0}}), Rectangle(
        fillColor={128,128,128},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        extent={{-70,-4.5},{0,4.5}})}));
end Sources;
