clear 
clc

% Symbolic variables
% syms l1 l2 l3; 
% syms q1 q2 q3;
% syms qd1 qd2 qd3;
% syms qdd1 qdd2 qdd3;
% syms lc1 lc2 lc3;
% syms Ixx1 Ixx2 Ixx3;
% syms Iyy1 Iyy2 Iyy3;
% syms Izz1 Izz2 Izz3;
% syms g;
% syms m1 m2 m3;
% 
syms Fx Fy Fz;
syms Mx My Mz;

l1 = 1; l2 = 1; l3 = 1;
q1 = 2; q2 = 0; q3 = pi/8;
qd1 = 44; qd2 = 44; qd3 = 44;
qdd1 = 0.3; qdd2 = 9; qdd3 = 0.01;
lc1 = l1/2; lc2 = l2/2; lc3 = l3/2;

Ixx1 = 0.0001; Ixx2 = 0.0001; Ixx3 = 0.0001;
Iyy1 = 0.0001; Iyy2 = 0.0001; Iyy3 = 0.0001;
Izz1 = 0.0001; Izz2 = 0.0001; Izz3 = 0.0001;

g = 9.81;
m1 = 2; m2 = 2; m3 = 2;

q = [q1 q2 q3];
qd = [qd1 qd2 qd3];
qdd = [qdd1 qdd2 qdd3];

alpha_1 = pi/2;
alpha_2 = 0;
alpha_3 = 0;

% Inertia
I1 = [Ixx1, 0, 0;0, Iyy1, 0;0, 0, Izz1];
I2 = [Ixx2, 0, 0;0, Iyy2, 0;0, 0, Izz2];
I3 = [Ixx3, 0, 0;0, Iyy3, 0;0, 0, Izz3];
% 
% I1 = [0, 0, 0;0, 0, 0;0, 0, 0];
% I2 = [0, 0, 0;0, 0, 0;0, 0, 0];
% I3 = [0, 0, 0;0, 0, 0;0, 0, 0];


% Links
L(1) = Link([0 0 l1 alpha_1 0]);
L(2) = Link([0 0 l2 alpha_2 0]);
L(3) = Link([0 0 l3 alpha_3 0]);

% Set mass
L(1).m = m1;
L(2).m = m2;
L(3).m = m3;

% Set inertia
L(1).I = I1;
L(2).I = I2;
L(3).I = I3;

% L(1).r = [lc1 0 0];1
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



fDegrees = 3;
DH = [
0 0 l1 pi/2 0
0 0 l2 0 0
0 0 l3 0 0
];

% Inercias 
I1 = [Ixx1, 0, 0; 0, Iyy1, 0; 0, 0, Izz1];
I2 = [Ixx2, 0, 0; 0, Iyy2, 0; 0, 0, Izz2];
I3 = [Ixx3, 0, 0; 0, Iyy3, 0; 0, 0, Izz3];
% 
% I1 = [0, 0, 0;0, 0, 0;0, 0, 0];
% I2 = [0, 0, 0;0, 0, 0;0, 0, 0];
% I3 = [0, 0, 0;0, 0, 0;0, 0, 0];


% Matrices de rotacion 
% 
% RotMatrix(:, :, 1) = [cos(q1), 0, sin(q1); sin(q1), 0, -cos(q1); 0, 1, 0];
% RotMatrix(:, :, 2) = [cos(q2), -sin(q2), 0; sin(q2), cos(q2), 0; 0, 0, 1];
% RotMatrix(:, :, 3) = [cos(q3), -sin(q3), 0; sin(q3), cos(q3), 0; 0, 0, 1];
% RotMatrix(:, :, 4) = [1, 0, 0; 0, 1, 0; 0, 0, 1];


RotMatrix(:, :, 1) = [cos(q1), -sin(q1) * cos(alpha_1), sin(q1) * sin(alpha_1); sin(q1), cos(q1) * cos(alpha_1), -cos(q1) * sin(alpha_1); 0, sin(alpha_1), cos(alpha_1)];
RotMatrix(:, :, 2) = [cos(q2), -sin(q2) * cos(alpha_2), sin(q2) * sin(alpha_2); sin(q2), cos(q2) * cos(alpha_2), -cos(q2) * sin(alpha_2); 0, sin(alpha_2), cos(alpha_2)];
RotMatrix(:, :, 3) = [cos(q3), -sin(q3) * cos(alpha_3), sin(q3) * sin(alpha_3); sin(q3), cos(q3) * cos(alpha_3), -cos(q3) * sin(alpha_3); 0, sin(alpha_3), cos(alpha_3)];
RotMatrix(:, :, 4) = [1, 0, 0; 0, 1, 0; 0, 0, 1];

% L(1).A(q1)
% RotMatrix(:, :, 1)
% 
% L(2).A(q2)
% RotMatrix(:, :, 2)
% 
% L(2).A(q3)
% RotMatrix(:, :, 3)

% DEBUG complete

for i=1:fDegrees + 1 
    InvRotMatrix(:, :, i) = inv(RotMatrix(:, :, i)); 
end

% Condiciones iniciales
w(:, 1) = [0; 0; 0];
w_dot(:, 1) = [0; 0; 0];
v(:, 1) = [0; 0; 0];
v_dot(:, 1) = [0; 0; g];
z(:, 1) = [0; 0; 1];

% w(:, 1) = sym ([0; 0; 0]);
% w_dot(:, 1) = sym([0; 0; 0]);
% v(:, 1) = sym([0; 0; 0]);
% v_dot(:, 1) = sym([0; 0; g]);
% z(:, 1) = [0; 0; 1];
% 
% f(:, fDegrees+1) = sym([0; 0; 0]);
% n(:, fDegrees+1) = sym([0; 0; 0]);


f(:, fDegrees+1) = [0; 0; 0];
n(:, fDegrees+1) = [0; 0; 0];

s(:, 1) = [-(l1 - lc1); 0; 0];
s(:, 2) = [-(l2 - lc2); 0; 0];
s(:, 3) = [-(l3 - lc3); 0; 0];

p(:, 1) = [l1; 0; 0];
p(:, 2) = [l2; 0; 0];
p(:, 3) = [l3; 0; 0];

% p(:, 1) = [l1*cos(q1); l1*sin(q1); 0];
% p(:, 2) = [l2*cos(q2); l2*sin(q2); 0];
% p(:, 3) = [l3*cos(q3); l3*sin(q3); 0];

q_dot = [qd1 qd2 qd3];
q_dot2 = [qdd1 qdd2 qdd3];
m = [m1, m2, m3];

I(:, :, 1) = I1;
I(:, :, 2) = I2;
I(:, :, 3) = I3;

for i = 2:fDegrees + 1
    % Angular velocity
    w(:, i) = InvRotMatrix(:, :, i - 1) * (w(:, i - 1) + z(:, 1) * q_dot(i - 1));
    % Angular acceleration
    w_dot(:, i) = InvRotMatrix(:, :, i - 1) * (w_dot(:, i - 1) + z(:, 1) * q_dot2(i - 1)) + cross(w(:, i - 1), z(:, 1) * q_dot(i - 1));
    % Linear acceleration
    v_dot(:, i) = cross(w_dot(:, i), p(:, i - 1)) + cross(w(:, i), cross(w(:, i), p(:, i - 1))) + InvRotMatrix(:, :, i - 1) * v_dot(:, i - 1);
    % Linear acceleration center of gravity
    a(:, i) = cross(w_dot(:, i), s(:, i - 1)) + cross(w(:, i), cross(w(:, i), s(:, i - 1))) + v_dot(:, i);
    
%     Translation
%     w(:, i) = InvRotMatrix(:, :, i-1)*w(:, i-1);
%     w_dot(:, i) = InvRotMatrix(:, :, i-1)*w_dot(:, i-1);
%     InvRotMatrix(:, :, i-1)*(z(:,1)*q_dot2(i-1) + v_dot(:, i-1));
%     v_dot(:, i) = InvRotMatrix(:, :, i-1)*(z(:,1)*q_dot2(i-1) + v_dot(:, i-1)) + 2 *cross(w(:, i), InvRotMatrix(:, :, i-1)*z(:,1)*q_dot(i-1))...
%         + cross(w_dot(:, i), p(:, i-1)) + cross(w(:, i),cross(w(:, i), p(:, i-1)));
%     a(:, i) = cross(w_dot(:, i), s(:, i-1)) + cross(w(:, i),cross(w(:, i), s(:, i-1))) + v_dot(:, i);
    
    
end


for i = fDegrees: -1 : 1
    % Force
    f(:, i) = RotMatrix(:, :, i + 1) * f(:, i + 1) + m(i) * a(:, i + 1);
    % Link torque
    n(:, i) = RotMatrix(:, :, i + 1) * (n(:, i + 1) + cross(InvRotMatrix(:, :, i + 1) * p(:, i), f(:, i + 1))) ...
    + cross(p(:, i) + s(:, i), m(i) * a(:, i + 1)) + I(:, :, i) * w_dot(:, i + 1) + cross(w(:, i + 1), I(:, :, i) * w(:, i + 1)); 
    % Joint torque
    T(:, i) = n(:, i).'* InvRotMatrix(:, :, i) * z(:, 1);
    %     Translation
    %  T(:, i) = f(:, i).'* InvRotMatrix(:, :, i) * z(:,1)
end
T