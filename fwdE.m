function [x t] = fwdE(fx,x0,tmax,h)

x(1) = x0;
t0 = 0;

for i = 1:(tmax/h)
    if i == 1
       x(i) = x0; 
    else
        x(i) = x(i-1) + (h * x(i-1));
        t(i) = i * h;
    end
end