clear 
clc
% Symbolic variables

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
syms gx gy gz;
syms Tc1 Tc2 Tc3;
syms b1 b2 b3;

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

% Set viscous friction
L(1).B = b1;
L(2).B = b2;
L(3).B = b3;

% Set Coulomb friction
L(1).Tc = Tc1;
L(2).Tc = Tc2;
L(3).Tc = Tc3;


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
%fext =[0 0 0 0 0 0]


R = SerialLink(L, 'name', 'leg');
% Inverse dynamics
disp("Inverse dynamics")
T = R.rne(q, qd, qdd, grav, fext);
%T = R.rne(q, qd, qdd, grav);


disp(T);
simplify(T(1))
simplify(T(2))
simplify(T(3))


disp("Inertia matrix")
disp(R.inertia(q));
R.gravity = [gx gy gz];
disp("Gravity matrix")
disp(R.gravload(q));
disp("Coriolis matrix")
disp(R.coriolis(q, qd));





