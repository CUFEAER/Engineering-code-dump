clc;clearvars;close all;
syms q1 q2 q3
syms L E A positive

LL = [L 13/12*L 5/4*L 5/12*L (3/4-5/12)*L];
AA = [A A 2*A A A];
d1 = [q1 q1*12/13 q1*4/5 0 0];
d2 = [0 q2*5/13 q2*3/5 0 0];
d3 = [0 -q3*5/13 0 -q3 q3];
DD = d1+d2+d3;
SS = DD./LL;
STRESS = SS*E;
S1 = subs(SS,{q1,q2,q3},{1,0,0});
S2 = subs(SS,{q1,q2,q3},{0,1,0});
S3 = subs(SS,{q1,q2,q3},{0,0,1});
Q1 = sum(S1.*STRESS.*AA.*LL);
Q2 = sum(S2.*STRESS.*AA.*LL);
Q3 = sum(S3.*STRESS.*AA.*LL);
q3 = solve(Q3,q3)
%req 1
Q1 = eval(Q1)
Q2 = eval(Q2)
Q = [Q1;Q2];
%req 2
k = equationsToMatrix(Q,q1,q2)
c = inv(k)
%req 3
q2 = solve (q3,q2)
ratio = eval(Q1)/eval(Q2)



