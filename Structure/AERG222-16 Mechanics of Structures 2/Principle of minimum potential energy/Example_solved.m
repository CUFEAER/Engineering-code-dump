clc;clearvars;close all;
syms q1 q2 q3
syms L E A positive
sa = sin(atan(5/12));
ca = cos(atan(5/12));
sb = sin(atan(9/12));
cb = cos(atan(9/12));
LL = [sqrt(120^2+50^2) 120 sqrt(120^2+90^2)];
AA = [A A A];
d1 = [q1*ca q1 q1*cb];
d2 = [q2*sa 0 -q2*sb];
DD = d1+d2;
SS = DD./LL;
STRESS = SS*E;
S1 = subs(SS,{q1,q2},{1,0});
S2 = subs(SS,{q1,q2},{0,1});
Q1 = sum(S1.*STRESS.*AA.*LL);
Q2 = sum(S2.*STRESS.*AA.*LL);
Q1 = eval(Q1)
Q2 = eval(Q2)
Q = [Q1;Q2];
k = equationsToMatrix(Q,q1,q2)
c = inv(k)
E = 10^7;
A = 1;
UU = E.*A./2./LL.*DD.^2;
U = simplify(vpa(sum(UU),4));
% Since I only have Q1 (given = 10000) in the direction of q1 then W = Q1q1
W = 10000*q1;
Ve = -W;
PI = U+Ve
e1 = diff(PI,q1);
e2 = diff(PI,q2);

[q1,q2] = solve(e1,e2,q1,q2)

