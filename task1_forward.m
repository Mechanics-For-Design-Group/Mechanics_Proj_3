% Initial D-H Parameters for alpha, a, d, theta.S
dG1 = 235.5;

a1I = 260;
d1I = 742.5-dG1;

alphaI2 = deg2rad(-90);
thetaI2 = deg2rad(-90);

a23 = 945;
theta23 = deg2rad(90);

a34 = 1025;

alpha46 = deg2rad(-90);
a46 = 220; 
d46 = 251.5;

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

TG6 = TG