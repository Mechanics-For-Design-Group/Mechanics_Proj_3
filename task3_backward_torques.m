% make a instance of Parameters_Class
Robot = IRB460();
% get public parameters
para = Robot.get_parameters();
% angles range
angle1L = para.angle1L;
angle1R = para.angle1R;
angle2L = para.angle2L;
angle2R = para.angle2R;
angle3L = para.angle3L;
angle3R = para.angle3R;
% D-H parameters
dG1 = para.dG1;
a1I = para.a1I;
d1I = para.d1I;
alphaI2 = para.alphaI2;
thetaI2 = para.thetaI2;
a23 = para.a23;w
theta23 = para.theta23;
a34 = para.a34;
alpha46 = para.alpha46;
a46 = para.a46;
d46 = para.d46;
% COMs
C1_1;
C7_3;
C6_2;
Q1_3;
S1_1;
C6_2;
SC8_1;
C9_3;
S2_1;
C11_4;

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

% adjacent coordinate systems
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

% root to everyone
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

% other Ts
T12 = T1I*TI2;
simplify(T12);
T13 = T12*T23;
simplify(T13);

% every COM(center of mass), relative to G
C1_G = trans(TG1, C1_1);
C2_3 = C7_3 + org(T32);
C2_G = trans(TG3, C2_3);
C4_2 = C6_2 + trans(T23, Q1_3);
C4_G = trans(TG2, C4_2);
C5_1 = S1_1 + trans(T12, C6_2);
C5_G = trans(TG1, C5_1);
C6_G = trans(TG2, C6_2);
C7_G = trans(TG3, C7_3);
C8_1 = org(T13) + SC8_1;
C8_G = trnas(TG1, C8_1);
C9_G = trans(TG3, C9_3);
C10_1 = org(T13) + S2_1 + trans(T13, C9_3);
C10_G = trans(TG1, C10_1);
C11_G = trans(TG4, C11_4);

% Functions: org, trans(calls transformed_p actually).
% function Mt = trunc_M(M, r1, r2, c1, c2)
%     Mt = M(r1:r2, c1,c2);
% end

function p = org(T)
    p = T(1:3,4);
end

function pt = transformed_p(T,p)
    pt1 = T*[p;1];
    pt = pt1(1:3,1);
end

function pt = trans(T,p)
    pt = transformed_p(T,p);
end