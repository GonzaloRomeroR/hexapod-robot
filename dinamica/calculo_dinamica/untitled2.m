
Fx = 1; Fy = 2; Fz = 3;
Mx = 1; My = 2; Mz = 3;


l1 = 1; l2 = 1; l3 = 1;
q1 = 0; q2 = 0; q3 = -pi/2;
qd1 = 44; qd2 = 44; qd3 = 44;
qdd1 = 0.3; qdd2 = 9; qdd3 = 0.01;
lc1 = l1/2; lc2 = l2/2; lc3 = l3/2;

Ixx1 = 0.0001; Ixx2 = 0.0001; Ixx3 = 0.0001;
Iyy1 = 0.0001; Iyy2 = 0.0001; Iyy3 = 0.0001;
Izz1 = 0.0001; Izz2 = 0.0001; Izz3 = 0.0001;

g = 9.81;
m1 = 2; m2 = 2; m3 = 2;
gx = 0; gy = 0; gz = 9.81;

q = [q1 q2 q3];
qd = [qd1 qd2 qd3];
qdd = [qdd1 qdd2 qdd3];


% Inertia
I1 = [Ixx1, 0, 0;0, Iyy1, 0;0, 0, Izz1];
I2 = [Ixx2, 0, 0;0, Iyy2, 0;0, 0, Izz2];
I3 = [Ixx3, 0, 0;0, Iyy3, 0;0, 0, Izz3];

Fx = 1; Fy = 0; Fz = 0;

a =                                                             [                                        Fy*cos(q1)*(l1 + l3*cos(q2 + q3) + l2*cos(q2)) - Fx*sin(q1)*(l1 + l3*cos(q2 + q3) + l2*cos(q2))
 Fz*(cos(q2 + q3)*(l3 + l2*cos(q3)) + l2*sin(q2 + q3)*sin(q3)) - Fy*(sin(q2 + q3)*sin(q1)*(l3 + l2*cos(q3)) - l2*cos(q2 + q3)*sin(q1)*sin(q3)) - Fx*(sin(q2 + q3)*cos(q1)*(l3 + l2*cos(q3)) - l2*cos(q2 + q3)*cos(q1)*sin(q3))
                                                                                                                                                  Fz*l3*cos(q2 + q3) - Fx*l3*sin(q2 + q3)*cos(q1) - Fy*l3*sin(q2 + q3)*sin(q1)
 ]
Fx = -1; Fy = 1; Fz = -3;
 
 b =[ -Fz*(l1 + l3*cos(q2 + q3) + l2*cos(q2))
    Fy*(l3 + l2*cos(q3)) + Fx*l2*sin(q3)
                                   Fy*l3]