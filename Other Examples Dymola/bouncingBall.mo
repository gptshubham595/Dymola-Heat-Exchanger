model bouncingBall 
  type Lenght=Real(unit="m");
  type Vel=Real(unit="m/s");
  type Acc=Real(unit="m/s2");
  parameter Real e = 0.8 "Coefficient of restitution";
  parameter Real radius(unit = "m") = 0.001 "Radius of ball in 'm'";
  //Real h(unit = "m") "Height of ball";
  Lenght h;
  Vel v(unit = "m/s") "Velocity of ball";
  parameter Acc g = -9.81 "Acceleration due to gravity";
initial equation
  h = 30;
  v = 0;
equation
  der(h) = v;
  der(v) = g;
  when h <= radius then
    reinit(v, -e * pre(v));
  end when;
end bouncingBall;
