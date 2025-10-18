

function dydt = boat_ode(t, y, v1, v2)
  

    x = y(1);
    y_pos = y(2); 

    
    r = sqrt(x^2 + y_pos^2);

  
    dydt = [ v1 - (v2 * x) / r;
             (v2 * y_pos) / r ];
end