clc;clearvars;close all;
syms z r1 r2 r3 m r1b r2b r3b mb

fx = r2+0.5*100*4-100;
fy = r1+r3+160-2*80;
m1 = m+r2*100+0.5*100*4*100/3;
m2 = -2*80*40+160*80+2000+r3*160-100*50;

[r1,r2,r3,m] = solve(fx,fy,m1,m2,r1,r2,r3,m)
fxb = r2b-1;
fyb = r1b+r3b;
m1b = mb+r2b*100;
m2b = r3b*160-50;

[r1b,r2b,r3b,mb] = solve(fxb,fyb,m1b,m2b,r1b,r2b,r3b,mb)
M_AB = m+r2*z+0.5/100*z*4*z*z/3
N_AB = -r1;
S_AB = diff(M_AB,z);

M_DC = 100*z;
N_DC = -r3;
S_DC = diff(M_DC,z);

cx = 100; cy = -r3; cm = 5000;

M_CB1 = cy*z-2000+cm;
N_CB1 = -cx;
S_CB1 = diff(M_CB1,z);

M_CB2 = M_CB1-160*(z-80)+(z-80)^2;
N_CB2 = -cx;
S_CB2 = diff(M_CB2,z);

M_ABb = mb+r2b*z
N_ABb = -r1b
S_ABb = diff(M_ABb,z)
M_DCb = z
N_DCb = -r3b
S_DCb = diff(M_DCb,z)

cxb = 1; cyb = -r3b; cmb = 50;

M_CB1b = cyb*z+cmb
N_CB1b = -cxb
S_CB1b = diff(M_CB1b,z)

M_CB2b = M_CB1b
N_CB2b = N_CB1b
S_CB2b = S_CB1b

I = 10^3*4/12;
A = 10*4;
Aeq = A*5/6;
E = 2e4;
G = E/2.6;

D1 = int((M_AB*M_ABb/E/I+N_AB*N_ABb/E/A+S_AB*S_ABb/G/Aeq),z,0,100);
D2 = int((M_DC*M_DCb/E/I+N_DC*N_DCb/E/A+S_DC*S_DCb/G/Aeq),z,0,50);
D3 = int((M_CB1*M_CB1b/E/I+N_CB1*N_CB1b/E/A+S_CB1*S_CB1b/G/Aeq),z,0,80);
D4 = int((M_CB2*M_CB2b/E/I+N_CB2*N_CB2b/E/A+S_CB2*S_CB2b/G/Aeq),z,80,160);

D = vpa(D1+D2+D3+D4)
