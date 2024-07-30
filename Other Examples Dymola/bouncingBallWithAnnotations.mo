model bouncingBallWithAnnotations "Bouncing Ball model with annotations"
  parameter Real e = 0.8 "Coefficient of restitution";
  parameter Real radius(unit = "m") = 0.001 "Radius of ball in 'm'";
  Real h(unit = "m") "Height of ball";
  Real v(unit = "m/s") "Velocity of ball";
  parameter Real g(unit = "m/s2") = -9.81 "Acceleration due to gravity";
initial equation
  h = 30;
  v = 0;
equation
  der(h) = v;
  der(v) = g;
  when h <= radius then
    reinit(v, -e * pre(v));
  end when;
  annotation(experiment(StartTime = 0, StopTime = 5), Documentation(info = "This is a bouncing ball model with annotations"), Icon(coordinateSystem(extent = {{-200, -100}, {100, 100}}, grid = {2, 2}, initialScale = 2), graphics = {Ellipse(origin = {-60, 26}, lineColor = {255, 0, 4}, fillColor = {0, 255, 8}, pattern = LinePattern.DashDot, fillPattern = FillPattern.Backward, lineThickness = 0.75, extent = {{-100, 50}, {150, -100}}, endAngle = 270)}), Diagram(coordinateSystem(extent = {{-200, -100}, {100, 100}}, grid = {2, 2}, initialScale = 2), graphics = {Line(origin = {-10, 0}, points = {{-50, -50}, {50, 50}}, color = {0, 0, 255}, pattern = LinePattern.Dash, thickness = 3)}),
    version = "",
    uses);
end bouncingBallWithAnnotations;
