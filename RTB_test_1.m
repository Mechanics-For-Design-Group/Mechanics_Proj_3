%% 参数定义
%机械臂为六自由度机械臂
clear L;
 
%角度转换
angle=pi/180;  %度
 
%D-H参数表
theta1 = 0;   D1 = 0.4;   A1 = 0.025; alpha1 = pi/2; offset1 = 0;
theta2 = pi/2;D2 = 0;     A2 = 0.56;  alpha2 = 0;    offset2 = 0;
theta3 = 0;   D3 = 0;     A3 = 0.035; alpha3 = pi/2; offset3 = 0;
theta4 = 0;   D4 = 0.515; A4 = 0;     alpha4 = pi/2; offset4 = 0;
theta5 = pi;  D5 = 0;     A5 = 0;     alpha5 = pi/2; offset5 = 0;
theta6 = 0;   D6 = 0.08;  A6 = 0;     alpha6 = 0;    offset6 = 0;

%% DH法建立模型,关节转角，关节距离，连杆长度，连杆转角，关节类型（0转动，1移动）

L(1) = Link([theta1, D1, A1, alpha1, offset1], 'standard');
L(2) = Link([theta2, D2, A2, alpha2, offset2], 'standard');
L(3) = Link([theta3, D3, A3, alpha3, offset3], 'standard');
L(4) = Link([theta4, D4, A4, alpha4, offset4], 'standard');
L(5) = Link([theta5, D5, A5, alpha5, offset5], 'standard');
L(6) = Link([theta6, D6, A6, alpha6, offset6], 'standard');

% 定义关节范围
L(1).qlim =[-180*angle, 180*angle];
L(2).qlim =[-180*angle, 180*angle];
L(3).qlim =[-180*angle, 180*angle];
L(4).qlim =[-180*angle, 180*angle];
L(5).qlim =[-180*angle, 180*angle];
L(6).qlim =[-180*angle, 180*angle];

%% 显示机械臂
robot0 = SerialLink(L,'name','six');
f = 1;								%画在第1张图上
theta = [0 pi/2 0 0 pi 0];				%初始关节角度
figure(f)
robot0.plot(theta);
title('六轴机械臂模型');
%% 加入teach指令，则可调整各个关节角度
robot1 = SerialLink(L,'name','sixsix');
f = 2;
figure(f)
robot1.plot(theta);
robot1.teach
title('六轴机械臂模型可调节');