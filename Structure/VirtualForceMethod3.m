clc;clearvars;close all;
syms r1 r2 r3 r4 z l p E A I G Aeq
assume(l>0);
assume(z>0);

fx = r1+r3+5*p+2*p;
fy = r2+r4-4*p;
m1 = 5/3*p*l+r1*l;
m2 = 2*p*l-4*p*l+2*l*r4;

[r1,r2,r3,r4] = solve(fx,fy,m1,m2,r1,r2,r3,r4);

N12 = -r2; Nb12 = -0.5;
S12 = 0; Sb12 = 0;  
%S12 does not actually equal zero, but since it's irrelavent here,
%I decided to equate it to zero just in case I would use this code in the future
%I am going to do this for each other irrelavent value in this problem, you
%edit to your liking
M12 = 0; Mb12 = 0;
N23 = 0; Nb23 = 0;
M23_1 = -r4*z; Mb23_1 = -0.5*z;
S23_1 = diff(M23_1,z); Sb23_1 = diff(Mb23_1,z);
M23_2 = M23_1+4*p*(z-l); Mb23_2 = Mb23_1+(z-l);
S23_2 = diff(M23_2,z); Sb23_2 = diff(Mb23_2,z);

d_actual = int((N12*Nb12/E/A+M12*Mb12/E/I+S12*Sb12/G/Aeq),z,0,l)+...
    int((N23*Nb23/E/A+M23_1*Mb23_1/2/E/I+Sb23_1*Sb23_1/G/Aeq),z,0,l)+...
    int((N23*Nb23/E/A+M23_2*Mb23_2/2/E/I+Sb23_2*Sb23_2/G/Aeq),z,l,2*l)

d_req = int((M12*Mb12/2/E/I),z,0,l)+...
    int((M23_1*Mb23_1/2/E/I),z,0,l)+...
    int((M23_2*Mb23_2/2/E/I),z,l,2*l) %neglecting axial and sheer effects (so weak in comparison)



