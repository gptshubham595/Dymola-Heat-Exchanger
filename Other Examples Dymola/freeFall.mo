class freeFall
  Real h(start = 30, unit = "m");
  Real v(start = 0, unit = "m/s");
  parameter Real g(unit = "m/s2") = 9.81 "Acceleration due to gravity";
  parameter Real a(unit = "m/s2") = -10 "Acceleration due to gravity";
equation
  /* Equations of motion */
  der(h) = v;
  der(v) = g;
end freeFall;
