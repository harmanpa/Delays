within Delays.Blocks.Logical;
block IntegerDelay "Delay an Integer signal with a fixed delay"
  extends Modelica.Blocks.Interfaces.PartialIntegerSISO;
  parameter Modelica.SIunits.Time t=1 "Delay time";
  Integer size(start=0);
protected
  final parameter Internal.Types.IntegerDelayer delayer=
      Internal.Types.IntegerDelayer(getInstanceName());
  discrete Modelica.SIunits.Time timeNext(start=Modelica.Constants.inf);
  Integer preu;
  Integer iteration;
  Integer preit;
equation
  preu = pre(u);
  preit = pre(iteration);
algorithm
  when {change(u),change(preu),time >= pre(timeNext),change(preit)} then
    if change(u) then
      size := Internal.Functions.Integers.push(
        delayer,
        u,
        time);
    end if;
    if time >= pre(timeNext) or pre(iteration) > 0 then
      //TODO: Need to handle case where multiple at same event iteration
      (y,size,iteration) := Internal.Functions.Integers.pop(delayer);
    end if;
    timeNext := Internal.Functions.Integers.nextTime(delayer, t);
  end when;
  annotation (Icon(graphics={
        Line(points={{-80,-66},{-68,-66},{-68,-22},{-48,-22},{-48,-66},{-48,-66}}),
        Line(points={{-16,-66},{-4,-66},{-4,-22},{16,-22},{16,-66},{16,-66}}),
        Line(points={{-48,-66},{-36,-66},{-36,-22},{-16,-22},{-16,-66},{-16,-66}}),
        Line(points={{16,-66},{28,-66},{64,-66},{58,-66},{48,-66},{48,-66}}),
        Line(points={{34,32},{46,32},{46,76},{66,76},{66,32},{66,32}}, color={255,
              128,0}),
        Line(points={{-30,32},{-18,32},{-18,76},{2,76},{2,32},{2,32}}, color={255,
              128,0}),
        Line(points={{2,32},{14,32},{14,76},{34,76},{34,32},{34,32}}, color={255,
              128,0}),
        Line(points={{-78,32},{-66,32},{-30,32},{-36,32},{-46,32},{-46,32}},
            color={255,128,0})}));
end IntegerDelay;
