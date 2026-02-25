%بسم الله الرحمن الرحيم
clc;clearvars;close all;
syms Q1 l z E A G Aeq I

M = Q1/2*(l-z)^2;
N = 0;
S = 0;
Mb1 = 1;
Mb2 = 0;
Nb = 0;
Sb = 0;
d = int(N*Nb/E/A+M*Mb1/E/I+S*Sb/G/Aeq,z,0,l/2)+int(N*Nb/E/A+M*Mb2/E/I+S*Sb/G/Aeq,z,l/2,l)
