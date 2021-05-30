function yk = expy(a,b,c,d,h,delx,maxx)
   format long g;
   xt = 0.0;
   yt = -0.0171532; 
%    yt = -0.053434;
   yk = zeros(ceil(maxx/0.1),1);
   i=1;
%    tanh = (exp(h*yt) - exp((-1)*h*yt))/(exp(h*yt) + exp((-1)*h*yt));
   while xt<=maxx
       yk(i,1) = yt;
       
%        yt = yt + delx*((-1)*(a*(cos(h*xt*yt))) + ((-1)*b*xt*yt^2) + ((-1)*(c*(cos(xt*(yt^3))))) + (d*cos(xt)));
%       yt = yt + delx*((-1)*(a*((exp(h*yt)-exp(-1)*h*yt)/(exp(h*yt)+exp(-1)*h*yt))) + ((-1)*b*cos(yt^2)) + ((-1)*(c*(xt*(yt^3)))) + (d*xt*sin(xt^2)));
%        yt = yt + delx*((-1)*(a*(xt*(sin(h*xt*yt)))) + ((-1)*b*sin(yt^2)) + ((-1)*(c*(xt*(yt^3)))) + (d*sin(xt)));
%          yt = yt + delx*((-1)*(a*(cosh(h*yt))) + ((-1)*(b*xt*(yt^2))) + ((-1)*(c*(sin(xt*(yt^3))))) + (d*cos(xt^3)));
%          yt = yt + delx*((-1)*(a*(cosh(h*yt))) + ((-1)*(b*xt*(yt^2))) + ((-1)*(c*(sin(xt*(yt^3))))) + (d*cos(xt^3)));
%        yt = yt + (d*sin(xt^2)  - (c*sin(xt*(yt^3)) + b*cos(xt*(yt^2)) + a*sin(h*xt*yt)))*delx;
%        yt = yt + delx*((-1)*(a*(sin(h*yt))) + ((-1)*(b*sin(xt*(yt)^2))) + ((-1)*(c*(sin(yt^3)))) + (d*sin(xt)));
       yt = yt + delx*((-1)*(a*(sin(h*xt*yt))) + ((-1)*b*cos(xt*(yt^2))) + ((-1)*(c*(sin(xt*(yt^3))))) + (d*sin(xt^2)));
%        yt = yt + delx*((-0.5)*(a*(exp(h*yt) + exp((-1)*h*yt))) + ((-1)*(b*sin(xt)*yt^2)) + (c*(-1)*xt*(yt)^3) + (d*sin(xt)));
%           yt = yt + delx*(((-1)* cosh(h*yt)) + ((-1)*(b*sin(xt)*yt^2)) + (c*(-1)*xt*(yt)^3) + (d*sin(xt)));
%        yt = yt + delx*((-1)*(a*(cosh(h*yt))) + ((-1)*(b*xt*(yt^2))) + ((-1)*(c*(sin(xt*(yt^3))))) + (d*cos(xt^3)));
%        yt = yt + delx*((-1)*( a*cosh(h*yt)) + (-1)*(b*xt*yt^2) + (-1)*(c*sin(xt*yt^3)) + d*cos(xt^3));
%        yt = yt + delx*((-1)*(a*(tanh(h*yt))) + ((-1)*b*cos(yt^2)) + ((-1)*c*xt*(yt^3)) + (d*xt*(sin(xt^2))));
%         yt = yt + delx*((-1)*(a*((exp(h*yt)-exp(-1)*h*yt)/(exp(h*yt)+exp(-1)*h*yt))) + ((-1)*b*cos(yt^2)) + ((-1)*(c*(xt*(yt^3)))) + (d*xt*sin(xt^2)));


       xt = xt + delx;
       i=i+1;
   end
end