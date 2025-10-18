f=[3;-1;-1];
a=[1 -2 1;4 -1 -2];
b=[11;-3];
aeq=[-2 1 0];
beq=1;
[x,fval]=linprog(-f,a,b,aeq,beq,zeros(3,1));
fprintf('x1=%.4f,x2=%.4f,x3=%.4f\nz:%.4f\n',x,-fval);
x1=0.0000,x2=1.0000,x3=1.0000
z:-2.0000