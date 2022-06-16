syms I m PC PL R theta t nl fl

N=I*diff(theta,t,2)+cross(diff(theta,t,1),I*diff(theta,t,1));
vCdot=cross(diff(theta,t,2),PC)+diff(theta,t,1);
F=m*vCdot;
%f:former   l:latter   C:质心
ff=R*fl+F;
nf=N+R*nl+cross(PC,F)+cross(PL,R*fl);