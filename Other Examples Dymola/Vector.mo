function Vector
 input Real x;
  output Real fx;
protected
 parameter  Real a[3]={1,2,3};  
algorithm
  fx:=0;
  for i in 1:3 loop
  fx:=fx+a[i]*x^(3-i);
  end for;
  //fx:=a[1]*x^2+a[2]*x+a[3];
end Vector;
