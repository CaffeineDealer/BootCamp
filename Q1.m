clear all; clear cashe; clc
%%
r = [0.5 2.8 3.3];
x0 = 0.1;

figure
for j = 1:length(r)
    for i = 1:50
        if i == 1
            x(1,j) = 0.1;
        else
            x(i,j) = r(j) * x(i-1,j) * (1 - x(i-1,j));
        end
    end
    plot(x(:,j),'LineWidth',2); hold on; grid on
end
legend({'r = 0.5','r = 2.8','r = 3.3'},'Location','SouthEast')
