theta1L = deg2rad(-165);
theta1R = deg2rad(165);
theta2L = deg2rad(-40);
theta2R = deg2rad(85);
theta3L = deg2rad(-20);
theta3R = deg2rad(120);

% Initial D-H Parameters for alpha, a, d, theta.S
dG1 = 235.5;
syms theta1;

a1I = 260;
d1I = 742.5-dG1;

alphaI2 = deg2rad(-90);
thetaI2 = deg2rad(-90);
syms theta2;

a23 = 945;
theta23 = deg2rad(90);
syms theta3;

a34 = 1025;
syms theta4;

alpha46 = deg2rad(-90);
a46 = 220; 
d46 = 251.5;