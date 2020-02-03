clear all; clear cache; clc
%% Q1 & Q2| FitzHugh-Nagumo model
% Initial values
v0 = 1; w0 = 0.1; 
a = 0.7; b = 0.8;
e = 0.08; 
I = 0.5; % set this to 0 for Q5
t = 400; steps = 0.001;
% Function
[v w rv rw] = FHN(v0,w0,a,b,e,I,t,steps);
%% Find Jacobian Matrix Systematically 
syms x y
J = jacobian([x - ((x^3)/3) - y + I , e * (x - a - (b * y))], [x,y]);
%% Find Jacobian Matrix by Hand
vs = rv(2,:);
jac(1,:) = [1 - (vs^2) , -1];
jac(2,:) = [e , - b * e];
%% Compute Eigenvalues with Matlab eig or by an expression
lda = eig(jac);
% Expression
vss = rv;
for i = 1:numel(vss)
    lambda(1,i) = (- vss(i)^2 + 1 - (b * e) + sqrt((vss(i)^2 - 1 - (e * b))^2 - (4 * e))) / 2;
    lambda(2,i) = (- vss(i)^2 + 1 - (b * e) - sqrt((vss(i)^2 - 1 - (e * b))^2 - (4 * e))) / 2;
end













