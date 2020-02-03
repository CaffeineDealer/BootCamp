function [v w rv rw] = FHN(v0,w0,a,b,e,I,t,steps)

% Written By Yavar Korkian
% This function calculates the FitzHugh-Nagumo model
% Inputs are defined as follow:
% parameters values a, b, and e are set by user
% I is the applied current, while t is the evloution time and steps are time step size
% The outputs are the membrane potential V, recovery variable W, and time steps ts 

ts = 0:steps:t;
v = v0;
w = w0;

% Compute the solution to the system
for i = 1:numel(ts)-1
    v(i+1) = ((steps + 1) * v(i)) + (steps * (-(v(i)^3)/3 - w(i) + I)); 
    w(i+1) = ((1 - e * b * steps) * w(i)) + (steps * e* (v(i) + a));
end

% Find nullcline of the system
vNC = @(v) v - (v.^3)/3 + I; % Fast (v-nullcline): w = v - (v^3)/3 + I
wNC = @(v) (v + a)/b; % Slow (w-nullcline): w = (v + a)/b
tss = -2:steps:2;

% Find fixed point of the system
vp = [(-1/3) 0 1 I];
wp = [-b a];
rv = roots(vp);
rw = roots(wp);

% Plots
figure
subplot(1,2,1)
plot(ts,v,'LineWidth',2,'Color','b')
xlabel 'Time'
ylabel 'Membrane Potential V'
subplot(1,2,2)
plot(v,w,'LineWidth',2,'Color','k')
xlabel 'Membrane Potential V'
ylabel 'Recovery Variable W'
hold on
fplot(vNC,'LineWidth',1,'Color','g','LineStyle','--')
fplot(wNC,'LineWidth',1,'Color','r','LineStyle','-.')
legend({'V-W','V-nullcline','W-nullcline'},'Location','NorthEast')
ylim([-0.3 1.5])

