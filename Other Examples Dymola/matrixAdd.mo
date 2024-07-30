class matrixAdd
parameter Real[3,2] m={{1,2},{2,3},{4,5}};
parameter Real[3,2] a={{2,2},{2,2},{2,2}};
Real[3,2] b;
Real max,i;
algorithm
  max:=0;
  i:=1;
  for i in 1:3 loop
    for j in 1:2 loop
      b[i,j]:=m[i,j]+a[i,j];
      if (max<b[i,j]) then
        max:=b[i,j];
      end if;
    end for;
  end for;
end matrixAdd;
