within ;
package Delays "Library of blocks for delaying discrete variables"
  extends Modelica.Icons.Package;

  annotation (
    Icon(graphics={
        Line(points={{-78,32},{-66,32},{-30,32},{-36,32},{-46,32},{-46,32}},
            color={95,95,95}),
        Line(points={{-30,32},{-18,32},{-18,76},{2,76},{2,32},{2,32}}, color={95,
              95,95}),
        Line(points={{2,32},{14,32},{14,76},{34,76},{34,32},{34,32}}, color={95,
              95,95}),
        Line(points={{34,32},{46,32},{46,76},{66,76},{66,32},{66,32}}, color={95,
              95,95}),
        Line(points={{-80,-66},{-68,-66},{-68,-22},{-48,-22},{-48,-66},{-48,-66}}),
        Line(points={{-48,-66},{-36,-66},{-36,-22},{-16,-22},{-16,-66},{-16,-66}}),
        Line(points={{-16,-66},{-4,-66},{-4,-22},{16,-22},{16,-66},{16,-66}}),
        Line(points={{16,-66},{28,-66},{64,-66},{58,-66},{48,-66},{48,-66}})}),
    version="0.0.1",
    uses(Modelica(version="3.2.2")),
    Documentation(info="<html>
<p>This library contains blocks to handle delays of discrete signals.</p>
</html>"));


end Delays;
