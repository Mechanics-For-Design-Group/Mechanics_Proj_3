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

TG6 = TG1 * T1I * TI2 * T23 * T34 * T46;
simplify(TG6);

dangle = deg2rad(5);
% angle1 = subs(angle1, angle1, angle1L);
angle1 = 0;
angle2 = subs(angle2, angle2, angle2L);
angle3 = subs(angle3, angle3, angle3L);
excutorCoord = eval(TG6 * [0;0;0;1]);
xs = [excutorCoord(1,1)];
zs = [excutorCoord(3,1)];
figure(1)
p1 = scatter(xs, zs);
p1.XDataSource = 'xs';
p1.YDataSource = 'zs';
axis equal
% angle2 = subs(angle2, angle2, angle2L);
% while angle2 <= angle2R
%     angle3 = subs(angle3, angle3, angle3L);
%     while angle3 <= angle3R
%         excutorCoord = eval(TG6*[0;0;0;1]);
%         xs(end+1) = double(excutorCoord(1,1));
%         zs(end+1) = double(excutorCoord(3,1));
%         angle3 = subs(angle3, angle3, eval(angle3)+dangle);
%         refreshdata;
%         drawnow;
%         % disp(rad2deg(eval(angle2)));
%     end
%     angle2 = subs(angle2, angle2, eval(angle2)+dangle);
% end

% test data 1
angle1 = deg2rad(0);
angle2 = deg2rad(0);
angle3 = deg2rad(0);
output1 = eval(TG6*[0;0;0;1]);

% test data 2
angle1 = deg2rad(30);
angle2 = deg2rad(30);
angle3 = deg2rad(30);
output2 = eval(TG6*[0;0;0;1]);

% test data 3
angle1 = deg2rad(60);
angle2 = deg2rad(60);
angle3 = deg2rad(60);
output3 = eval(TG6*[0;0;0;1]);