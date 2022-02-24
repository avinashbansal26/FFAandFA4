function [F]= Finsler_metric_as_variables()
% This function gives the symbolic finsler mertix which is further the
% function of 15 cofficents of 4th order tensor and [1 3] vector.
syms Finsler_fun(y1,y2,y3);
syms a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15;
Finsler_fun(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,y1,y2,y3)=...
                 (a15*(y1)^4 + a5*(y2)^4 + a1*(y3)^4 + a14*(y1)^3*(y2) + a13*(y1)^3*(y3) + ...
                  a4*(y2)^3*(y3)+ a9*(y1)*(y2)^3+ a6*(y1)*(y3)^3+ a2*(y2)*(y3)^3 +...
                  a12*(y1)^2*(y2)^2 + a10*(y1)^2*(y3)^2 + a3*(y2)^2*(y3)^2 +... 
                  a11*(y1)^2*(y2)*(y3)+ a8*(y1)*(y2)^2*(y3) + a7*(y1)*(y2)*(y3)^2)^(1/4);
          
g11 = (1/2)*(diff(diff(Finsler_fun^2,y1),y1));
g12 = (1/2)*(diff(diff(Finsler_fun^2,y1),y2));
g13 = (1/2)*(diff(diff(Finsler_fun^2,y1),y3));
g22 = (1/2)*(diff(diff(Finsler_fun^2,y2),y2));
g23 = (1/2)*(diff(diff(Finsler_fun^2,y2),y3));
g33 = (1/2)*(diff(diff(Finsler_fun^2,y3),y3));

% due to symmetricity we write Finsler metric in this way

F= [g11 g12 g13;
    g12 g22 g23;
    g13 g23 g33];

end
    