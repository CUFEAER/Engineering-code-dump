clc;clearvars;close all;
syms q1 q2 q3
syms L E A positive
r2 = sqrt(2);
ct = cosd(45);
LL = [L r2*L L];
AA = [A r2*A A];
d1 = [q1 q1*ct 0];
d2 = [0 q2*ct q2];
%d3 = [3/5*q3 0 0 q3];
DD = d1+d2;
SS = DD./LL;
STRESS = SS*E;
S1 = subs(SS,{q1,q2,q3},{1,0,0});
S2 = subs(SS,{q1,q2,q3},{0,1,0});
S3 = subs(SS,{q1,q2,q3},{0,0,1});
Q1 = sum(S1.*STRESS.*AA.*LL);
Q2 = sum(S2.*STRESS.*AA.*LL);
Q3 = sum(S3.*STRESS.*AA.*LL);
q3 = solve(Q3,q3);
Q1 = eval(Q1)
Q2 = eval(Q2)
Q = [Q1;Q2];
k = equationsToMatrix(Q,q1,q2)
c = inv(k)