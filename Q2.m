clear all; clear cache; clc
%%
x0 = 1;
t = 0:5;
tmax = 5;
h = [0.1 0.01 0.001];
figure
for i = 1:3
    for j = 1:length(tmax)
        [xx{i,j} tt{i,j}] = fwdE(exp(t(j)),x0,tmax,h(i));
    end
    plot(tt{i,1},xx{i,1},'LineWidth',2); hold on; grid on
end
xlabel 't'; 
ylabel 'x(t)';