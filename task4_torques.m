% make a instance of Parameters_Class
Robot = IRB460();
% get public parameters
para = Robot.get_parameters();
angle1L = para.angle1L;
angle1R = para.angle1R;
angle2L = para.angle2L;
angle2R = para.angle2R;
angle3L = para.angle3L;
angle3R = para.angle3R;
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

T1G = inv(TG1);
simplify(T1G);

TI1 = inv(T1I);
simplify(TI1);

T2I = inv(T2I);
simplify(T2I);

T32 = inv(T23);
simplify(T32);

T43 = inv(T34);
simplify(T43);

T64 = inv(T46);
simplify(T64);

simplify(TG1);

TGI = TG1 * T1I;
simplify(TGI);

TG2 = TGI * TI2;
simplify(TG2);

TG3 = TG2 * T23;
simplify(TG3);

TG4 = TG3 * T34;
simplify(TG4);

TG6 = TG4 * T46;
simplify(TG6);

MC1_G = TG1 * [C1_1;1];
C1_G = MC1_G(1:3,4);

C2_3 = C7_3 + T32(1:3,4);
MC2_G = TG3 * (C7_3 + T32(1:3,4)); 
C2_G = MC2_G(1:3,4);

C3_G = C3_G;


C4_2 = C6_2 + T23*2*C2_3;
C4_G = TG4 * (C6_2 + T23*2*C2_3);

C5_G = TG2 * C6_2 + 2*C3_G;