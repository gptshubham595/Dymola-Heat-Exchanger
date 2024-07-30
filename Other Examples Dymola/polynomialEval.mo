function polynomialEval
   
   input Real x;
   output Real fx "F of x";
   output Real gx "G of x"; 
protected
   parameter Real a=1;
   parameter Real b=2;
   parameter Real c=1;
algorithm
  fx:=a*(x^2)+b*x+c;
  gx:=a*x^2-b*x+c;
  
end polynomialEval;

