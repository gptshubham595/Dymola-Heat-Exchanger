model FluidWORKING
  parameter Real Fci(unit = "kg/h")=200 "Feed cold in/out";
  parameter Real Fhi(unit = "kg/h")=70 "Feed hot in/out";
  parameter Real Tci(unit = "K")=80 "Temp cold in";
  parameter Real Thi(unit = "K")=255 "Temp hot in";
  parameter Real U(unit = "kg/Km^2s^2")=2000 "Heat transfer coefficient";
  parameter Real Area(unit = "m^2")=200 "Area";
  parameter Real Volume(unit = "m^3")=5 "Volume";
  parameter Real Density(unit = "kg/m^3")=10 "Density";
  parameter Real Cp(unit = "Jkg^-1K-1")=150 "Specific Heat";

  Real Tco,Tho;
initial equation
    Tco = Tci+1;
    Tho = Thi-1;
equation
  der(Tco)=if Tho-Tco <= 0 then 0 else (Fci*Cp*Density*(Tci-Tco)+U*Area*((Thi-Tco)-(Tho-Tci))/log((Thi-Tci)/(Tho-Tco)))/(Volume*Cp*Density);
  der(Tho)=if Tho-Tco <= 0 then 0 else (Fhi*Cp*Density*(Thi-Tho)-U*Area*((Thi-Tco)-(Tho-Tci))/log((Thi-Tci)/(Tho-Tco)))/(Volume*Cp*Density);

  annotation (experiment(StopTime=3600, __Dymola_Algorithm="Dassl"), Icon(
        graphics={
        Rectangle(
          extent={{-46,44},{56,-36}},
          lineColor={28,108,200},
          color={0,0,0},
          radius=1,
          fillColor={206,206,0},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{-44,30},{54,-22}},
          lineColor={28,108,200},
          color={0,0,0},
          radius=1,
          fillColor={0,128,192},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{42,-36},{52,-50}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={192,192,192}),
        Rectangle(
          extent={{-42,58},{-32,44}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={192,192,192}),
        Polygon(
          points={{-3,4},{3,0},{-3,-4},{-3,4}},
          lineColor={28,108,200},
          origin={-37,64},
          rotation=270),
        Polygon(points={{74,4},{80,0},{74,-4},{74,4}}, lineColor={28,108,200}),
        Polygon(points={{-58,4},{-52,0},{-58,-4},{-58,4}}, lineColor={28,108,
              200}),
        Polygon(
          points={{-3,4},{3,0},{-3,-4},{-3,4}},
          lineColor={28,108,200},
          origin={49,-72},
          rotation=270),
        Line(points={{-58,0},{-74,0}}, color={28,108,200}),
        Line(points={{-38,70}}, color={28,108,200}),
        Line(points={{-36,70}}, color={28,108,200}),
        Line(points={{-36,70}}, color={28,108,200}),
        Line(points={{-38,68},{-38,78}}, color={28,108,200}),
        Line(points={{48,-68},{48,-58}}, color={28,108,200}),
        Line(points={{74,0},{58,0}}, color={28,108,200}),
        Text(
          extent={{-30,76},{-30,74}},
          lineColor={28,108,200},
          textString="T Heat IN",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{64,-72},{64,-70}},
          lineColor={28,108,200},
          textString="T Heat out",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{-72,-2},{-72,-6}},
          lineColor={28,108,200},
          textString="T cold in",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{82,-8},{82,-8}},
          lineColor={28,108,200},
          textString="T cold out",
          textStyle={TextStyle.Bold})}),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end FluidWORKING;
