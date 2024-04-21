%% LCL filter Design
clc
clear
close
%% inputs
pn=15e3;
vl=380;
ripple=0.1;
fsw=16e3;
Vdc=553;
f=60;
%%
Imax=pn*sqrt(2)/(sqrt(3)*vl)
deltaImax=ripple*Imax
L1=Vdc/(6*fsw*deltaImax)
Zb=vl^2/pn
Cb=1/(2*pi*f*Zb)
Cf=.05*Cb
%% fres 
fres=6e3
wres=2*pi*fres
syms L2
L22=solve(wres^2==(L1+L2)/(Cf*L2*L1),L2)
L2=double(L22)
Rf=1/(3*wres*Cf)
