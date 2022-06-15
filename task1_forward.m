% make a instance of Parameters_Class
Robot = IRB460();
% get public parameters
para = Robot.get_parameters();
dG1 = para.dG1;
a1I = para.a1I;
d1I = para.d1I;
alphaI2 = para.alphaI2;
thetaI2 = para.thetaI2;
a23 = para.a23;
theta23 = para.theta23;
a34 = para.a34;
alpha46 = para.alpha46;
a46 = para.a46; 
d46 = para.d46;

% establish T from alpha, a, d, theta
syms alpha a d theta
T = [cos(theta), -sin(theta), 0, a;
    sin(theta)*cos(alpha), cos(theta)*cos(alpha), -sin(alpha), -sin(alpha)*d;
    sin(theta)*sin(alpha), cos(theta)*sin(alpha), cos(alpha), cos(alpha)*d;
    0, 0, 0, 1];

% establish Ts from T, parameters, angle1, angle2, angle3.
syms angle1 angle2 angle3
TG1 = subs(T, [alpha, a, d, theta], [0, 0, dG1, 0+angle1]);
T1I = subs(T, [alpha, a, d, theta], [0, a1I, d1I, 0]);
TI2 = subs(T, [alpha, a, d, theta], [alphaI2, 0, 0, thetaI2+angle2]);
T23 = subs(T, [alpha, a, d, theta], [0, a23, 0, theta23+angle3-angle2]);
T34 = subs(T, [alpha, a, d, theta], [0, a34, 0, -angle3]);
T46 = subs(T, [alpha, a, d, theta], [alpha46, a46, d46, 0]);