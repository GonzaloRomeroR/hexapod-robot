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

q = [q1 q2 q3];
qd = [qd1 qd2 qd3];
qdd = [qdd1 qdd2 qdd3];

% Inertia
I1 = [Ixx1, 0, 0;0, Iyy1, 0;0, 0, Izz1];
I2 = [Ixx2, 0, 0;0, Iyy2, 0;0, 0, Izz2];
I3 = [Ixx3, 0, 0;0, Iyy3, 0;0, 0, Izz3];
% 
% I1 = [0, 0, 0;0, 0, 0;0, 0, 0];
% I2 = [0, 0, 0;0, 0, 0;0, 0, 0];
% I3 = [0, 0, 0;0, 0, 0;0, 0, 0];


% Links
L(1) = Link([0 0 l1 pi/2 0]);
%L(1) = Link([0 -l1 0 -pi/2 0]);
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

% L(1).r = [lc1 0 0];
% L(2).r = [lc2 0 0];
% L(3).r = [lc3 0 0];

% Set distance to center of mass
L(1).r = [-(l1-lc1) 0 0];
L(2).r = [-(l2-lc2) 0 0];
L(3).r = [-(l3-lc3) 0 0];

% L(1).r = [-(l1/2) 0 0];
% L(2).r = [-(l2/2) 0 0];
% L(3).r = [-(l3/2) 0 0];

% L(1).r = [-(0) 0 0];
% L(2).r = [-(0) 0 0];
% L(3).r = [-(0) 0 0];


% Set gear relation
L(1).G = 1;
L(2).G = 1;
L(3).G = 1;

% Set motor inertia
L(1).Jm = 0;
L(2).Jm = 0;
L(3).Jm = 0;

% gravity and exterior forces
grav = [0 0 g];
fext =[Fx Fy Fz Mx My Mz];

% DH = [
% 0 0 l1 pi/2 0 
% 0 0 l2 0 0 
% -pi/2 0 l3 0 0
% ];

R = SerialLink(L, 'name', 'leg');
% Inverse dynamics
disp("Inverse dynamics")
%T = R.rne(q, qd, qdd, grav, fext);
T = R.rne(q, qd, qdd, grav);
disp(T);
T(1)
T(2)
T(3)
disp("Inertia matrix")
disp(R.inertia(q));
R.gravity = [0 0 g];
disp("Gravity matrix")
disp(R.gravload(q));
disp("Coriolis matrix")
disp(R.coriolis(q, qd));