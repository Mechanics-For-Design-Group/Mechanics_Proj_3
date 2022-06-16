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

TG6 = TG1 * T1I * TI2 * T23 * T34 * T46;
simplify(TG6);


%通过改进D-H参数建立连杆，那个参数为变量就不写那个参数。
L(1) = Link('theta',  0+angle1             ,'d',dG1,   'a' , 0   , 'alpha', 0       , 'qlim', [angle1L,angle1R], 'modified');
L(I) = Link('theta',  0                    ,'d',d1I,   'a' , a1I , 'alpha', 0       ,                            'modified');
L(2) = Link('theta',  thetaI2+angle2       ,'d',0  ,   'a' , 0   , 'alpha', alphaI2 , 'qlim', [angle2L,angle2R], 'modified');
L(3) = Link('theta',  theta23+angle3-angle2,'d',0  ,   'a' , 0   , 'alpha', 0       , 'qlim', [angle3L,angle3R], 'modified');
L(4) = Link('theta',  -angle3              ,'d',0  ,   'a' , 0   , 'alpha', 0       ,                            'modified');
L(6) = Link('theta',  0                    ,'d',d46,   'a' , a46 , 'alpha', alpha46 ,                            'modified');
IRB460 = SerialLink(L);   %建立模型

IRB460.plotopt = {'workspace',[-10,10,-10,10,-10,10],'tilesize',4};  %设置模型空间大小和地砖大小
IRB460.teach;       %画出模型并进行调控