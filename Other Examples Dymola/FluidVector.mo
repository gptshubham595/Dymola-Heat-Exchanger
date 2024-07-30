model FluidVector
  input Real Fci;
  input Real Fhi;
  input Real Tci;
  input Real Thi;
  input Real Tho;
  input Real U;
  input Real Area;
  input Real Volume;
  input Real Density; 
  input Real Cp;
  
  output Real Tco; 
equation
  
  der(Tco)=(Fci*Cp*Density*(Tci-Tco)-U*Area*((Tci-Thi)-(Tco-Tho))/log((Tci-Thi)/(Tco-Tho)))/(Volume*Cp*Density);    
  
end FluidVector;
