%变量后缀：f:former   l:latter   C:质心
syms theta thetadot thetadotdot

omega={};
omegadot={};
for i=1:6
    omega{i+1}=R{i+1,i}*omega{i}+thetadot{i}*Z{i+1};
    omegadot{i+1}=R{i+1,i}*omegadot{i}+cross(R{i+1,i}*omega{i},thetadot{i+1}*Z{i+1}+thetadotdot{i}*Z{i+1});
    vdot{i+1}=R{i+1,i}*(cross(omega{i},P{i})+cross(omega{i},cross(omega{i},P{i}))+vdot{i});
    vCdot{i}=cross(omegadot{i},PC{i})+cross(omega{i},omega{i}+PC{i})+vdot{i};
    F{i}=m*vCdot{i};
    N{i}=IC{i}*omegadot{i}+cross(omega{i},IC{i}*omega{i});
end



% %欧拉方程
% N=IC*diff(omega,t,1)+cross(omega,IC*omega);
% 
% %牛顿方程
% F=m*vCdot;
% 
% %迭代方程
% ff=R*fl+F;
% nf=N+R*nl+cross(PC,F)+cross(PL,R*fl);

for j=6:-1:1
    f{j}=R{j,j+1}*f{j+1}+F{j};
    n{j}=N{j}+R{j,j+1}*n{j+1}+cross(PC{j},F{j})+cross(P{j},R{j,j+1}*f{j+1});
end
