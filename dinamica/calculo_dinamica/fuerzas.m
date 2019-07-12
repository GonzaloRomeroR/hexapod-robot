clear 
clc
% Symbolic variables
% 
syms l1 l2 l3; 
syms q1 q2 q3;
syms qd1 qd2 qd3;
syms qdd1 qdd2 qdd3;
syms lc1 lc2 lc3;
syms Ixx1 Ixx2 Ixx3;
syms Iyy1 Iyy2 Iyy3;
syms Izz1 Izz2 Izz3;
syms g;
syms m1 m2 m3;
syms Fx Fy Fz;
syms Mx My Mz;
syms Ixy1 Iyz1 Izx1;
syms Ixy2 Iyz2 Izx2;
syms Ixy3 Iyz3 Izx3;
syms gx gy gz

assume(q1,'real')
assume(q2,'real')
assume(q3,'real')

assume(l1,'real')
assume(l2,'real')
assume(l3,'real')

assume(Fx,'real')
assume(Fy,'real')
assume(Fz,'real')


% 
% Fx = 1; Fy = 2; Fz = 3;
% Mx = 1; My = 2; Mz = 3;
% 
% 
% l1 = 1; l2 = 1; l3 = 1;
% q1 = 2; q2 = 0; q3 = pi/8;
% qd1 = 44; qd2 = 44; qd3 = 44;
% qdd1 = 0.3; qdd2 = 9; qdd3 = 0.01;
% lc1 = l1/2; lc2 = l2/2; lc3 = l3/2;
% 
% Ixx1 = 0.0001; Ixx2 = 0.0001; Ixx3 = 0.0001;
% Iyy1 = 0.0001; Iyy2 = 0.0001; Iyy3 = 0.0001;
% Izz1 = 0.0001; Izz2 = 0.0001; Izz3 = 0.0001;
% 
% g = 9.81;
% m1 = 2; m2 = 2; m3 = 2;
% gx = 0; gy = 0; gz = 9.81;

q = [q1 q2 q3];
qd = [qd1 qd2 qd3];
qdd = [qdd1 qdd2 qdd3];


% Inertia
I1 = [Ixx1, 0, 0;0, Iyy1, 0;0, 0, Izz1];
I2 = [Ixx2, 0, 0;0, Iyy2, 0;0, 0, Izz2];
I3 = [Ixx3, 0, 0;0, Iyy3, 0;0, 0, Izz3];

% Inertia
% I1 = [Ixx1, Ixy1, Izx1; Ixy1, Iyy1, Iyz1; Izx1, Iyz1, Izz1];
% I2 = [Ixx2, Ixy2, Izx2; Ixy2, Iyy2, Iyz2; Izx2, Iyz2, Izz2];
% I3 = [Ixx3, Ixy3, Izx3; Ixy3, Iyy3, Iyz3; Izx3, Iyz3, Izz3];


% 
% I1 = [0, 0, 0;0, 0, 0;0, 0, 0];
% I2 = [0, 0, 0;0, 0, 0;0, 0, 0];
% I3 = [0, 0, 0;0, 0, 0;0, 0, 0];

% Links
L(1) = Link([0 0 l1 pi/2 0]);
L(2) = Link([0 0 l2 0 0]);
L(3) = Link([-pi/2 0 l3 0 0]);

% Set mass
L(1).m = m1;
L(2).m = m2;
L(3).m = m3;

% Set inertia
L(1).I = I1;
L(2).I = I2;
L(3).I = I3;


% Set distance to center of mass
L(1).r = [-(l1-lc1) 0 0];
L(2).r = [-(l2-lc2) 0 0];
L(3).r = [-(l3-lc3) 0 0];


% Set gear relation
L(1).G = 1;
L(2).G = 1;
L(3).G = 1;

% Set motor inertia
L(1).Jm = 0;
L(2).Jm = 0;
L(3).Jm = 0;

% gravity and exterior forces
grav = [gx gy gz];
fext =[Fx Fy Fz Mx My Mz];
fext =[Fx Fy Fz 0 0 0];


R = SerialLink(L, 'name', 'leg');
% Inverse dynamics
disp("Inverse dynamics")
%T = R.rne(q, qd, qdd, grav, fext);
T = R.rne(q, qd, qdd, grav);

% Calculo de la componente de fuerza en el efector final.
% Calculo de la matriz jacobiana


trans = [ cos(q2 + q3)*cos(q1), -sin(q2 + q3)*cos(q1),  sin(q1);
 cos(q2 + q3)*sin(q1), -sin(q2 + q3)*sin(q1), -cos(q1);
         sin(q2 + q3),          cos(q2 + q3),        0]
     
invtrans = [ cos(q2 + q3)*cos(q1), -sin(q2 + q3)*cos(q1),  sin(q1);
 cos(q2 + q3)*sin(q1), -sin(q2 + q3)*sin(q1), -cos(q1);
         sin(q2 + q3),          cos(q2 + q3),        0].'
     
A = zeros(3, 3)
matrix = [trans, A; A, trans]
invmatrix = [invtrans, A; A, invtrans]
R.jacob0(q)
R.jacobe(q)

invmatrix * R.jacob0(q)
matrix * R.jacobe(q)

% disp('Matriz jacobiana')
% R.jacob0(q) 
% disp('Matriz jacobiana transpuesta')
% R.jacob0(q)'
% disp('Termino relacionado con la fuerza del robot')
% transformation_matrix = R.fkine(q)



JTf = R.jacobn(q).' * fext.'
JTf = R.jacobe(q).' * fext.'
JTf0 = R.jacob0(q).' * fext.'
% 
% 
% %jtf0 = trans.' * JTf0
% 
% 
% % JTf = simplify(R.jacobn(q)' * fext')
% % JTf = simplify(R.jacobe(q)' * fext')
% % JTf0 = simplify(R.jacob0(q)' * fext')
% % jtf0 = simplify(inv(trans) * JTf)

