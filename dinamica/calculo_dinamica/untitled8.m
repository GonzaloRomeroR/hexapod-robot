
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

a = m3*(2*l3*lc3*qdd2 - l3^2*qdd3 - (l3^2*qd1^2*sin(2*q2 + 2*q3))/2 - l3^2*qdd2 + 2*l3*lc3*qdd3 + g*lc3*cos(q2 + q3) + (l2*lc3*qd1^2*sin(2*q2 + q3))/2 + l3*lc3*qd1^2*sin(2*q2 + 2*q3) + l2*lc3*qdd2*cos(q3) + l1*lc3*qd1^2*sin(q2 + q3) + (l2*lc3*qd1^2*sin(q3))/2 + l2*lc3*qd2^2*sin(q3))

b = lc3*m3*(lc3*qdd2 + lc3*qdd3 + g*cos(q2 + q3) + (lc3*qd1^2*sin(2*q2 + 2*q3))/2 + l2*qdd2*cos(q3) + l1*qd1^2*sin(q2 + q3) + (l2*qd1^2*sin(q3))/2 + l2*qd2^2*sin(q3) + (l2*qd1^2*sin(2*q2 + q3))/2)

c = l2^2*m3*qdd2 + lc2^2*m2*qdd2 + lc3^2*m3*qdd2 + lc3^2*m3*qdd3 + g*lc3*m3*cos(q2 + q3) + g*l2*m3*cos(q2) + g*lc2*m2*cos(q2) + (l2^2*m3*qd1^2*sin(2*q2))/2 + (lc2^2*m2*qd1^2*sin(2*q2))/2 + (lc3^2*m3*qd1^2*sin(2*q2 + 2*q3))/2 + l1*lc3*m3*qd1^2*sin(q2 + q3) + l1*l2*m3*qd1^2*sin(q2) + l1*lc2*m2*qd1^2*sin(q2) - l2*lc3*m3*qd3^2*sin(q3) + l2*lc3*m3*qd1^2*sin(2*q2 + q3) + 2*l2*lc3*m3*qdd2*cos(q3) + l2*lc3*m3*qdd3*cos(q3) - 2*l2*lc3*m3*qd2*qd3*sin(q3)

d = l2^2*m3*qdd2 - l2^2*m2*qdd2 - l3^2*m3*qdd2 - l3^2*m3*qdd3 + 2*l2*lc2*m2*qdd2 + 2*l3*lc3*m3*qdd2 + 2*l3*lc3*m3*qdd3 + g*lc3*m3*cos(q2 + q3) + g*l2*m3*cos(q2) + g*lc2*m2*cos(q2) - (l2^2*m2*qd1^2*sin(2*q2))/2 + (l2^2*m3*qd1^2*sin(2*q2))/2 - (l3^2*m3*qd1^2*sin(2*q2 + 2*q3))/2 + l1*lc3*m3*qd1^2*sin(q2 + q3) + l1*l2*m3*qd1^2*sin(q2) + l1*lc2*m2*qd1^2*sin(q2) - l2*lc3*m3*qd3^2*sin(q3) + l2*lc3*m3*qd1^2*sin(2*q2 + q3) + l2*lc2*m2*qd1^2*sin(2*q2) + l3*lc3*m3*qd1^2*sin(2*q2 + 2*q3) + 2*l2*lc3*m3*qdd2*cos(q3) + l2*lc3*m3*qdd3*cos(q3) - 2*l2*lc3*m3*qd2*qd3*sin(q3)

e = l1^2*m2*qdd1 + l1^2*m3*qdd1 + (l2^2*m3*qdd1)/2 + lc1^2*m1*qdd1 + (lc2^2*m2*qdd1)/2 + (lc3^2*m3*qdd1)/2 + (l2^2*m3*qdd1*cos(2*q2))/2 + (lc2^2*m2*qdd1*cos(2*q2))/2 + (lc3^2*m3*qdd1*cos(2*q2 + 2*q3))/2 + l2*lc3*m3*qdd1*cos(2*q2 + q3) + (lc3^2*m3*qd1*qd2*sin(q2))/2 + (lc3^2*m3*qd1*qd3*sin(q3))/2 - (lc3^2*m3*qd1*qd2*sin(q2 + 2*q3))/2 - (lc3^2*m3*qd1*qd3*sin(2*q2 + q3))/2 + 2*l1*lc3*m3*qdd1*cos(q2 + q3) - (l2^2*m3*qd1*qd2*sin(2*q2))/2 - (lc2^2*m2*qd1*qd2*sin(2*q2))/2 + 2*l1*l2*m3*qdd1*cos(q2) + 2*l1*lc2*m2*qdd1*cos(q2) + l2*lc3*m3*qdd1*cos(q3) - (lc3^2*m3*qd1*qd2*sin(2*q2 + 2*q3))/2 - (lc3^2*m3*qd1*qd3*sin(2*q2 + 2*q3))/2 - l1*lc3*m3*qd1*qd2*sin(q2 + q3) - l1*lc3*m3*qd1*qd3*sin(q2 + q3) - (l2*lc3*m3*qd1*qd2*sin(q2 + q3))/2 - l1*l2*m3*qd1*qd2*sin(q2) - l1*lc2*m2*qd1*qd2*sin(q2) - l1*lc3*m3*qd1*qd2*sin(q3) - l1*lc3*m3*qd1*qd3*sin(q2) - (l2*lc3*m3*qd1*qd3*sin(q3))/2 + (l2*lc3*m3*qd1*qd2*sin(q2 - q3))/2 - l2*lc3*m3*qd1*qd2*sin(2*q2 + q3) - (l2*lc3*m3*qd1*qd3*sin(2*q2 + q3))/2 - (l2*lc3*m3*qd1*qd3*sin(2*q2))/2

f =  l1^2*m2*qdd1 - l1^2*m1*qdd1 + l1^2*m3*qdd1 - (l2^2*m2*qdd1)/2 + (l2^2*m3*qdd1)/2 - (l3^2*m3*qdd1)/2 + 2*l1*lc1*m1*qdd1 + l2*lc2*m2*qdd1 + l3*lc3*m3*qdd1 - (l2^2*m2*qdd1*cos(2*q2))/2 + (l2^2*m3*qdd1*cos(2*q2))/2 - (l3^2*m3*qdd1*cos(2*q2 + 2*q3))/2 + l2*lc3*m3*qdd1*cos(2*q2 + q3) + l2*lc2*m2*qdd1*cos(2*q2) + l3*lc3*m3*qdd1*cos(2*q2 + 2*q3) + 2*l1*lc3*m3*qdd1*cos(q2 + q3) + l2^2*m2*qd1*qd2*sin(2*q2) - l2^2*m3*qd1*qd2*sin(2*q2) + 2*l1*l2*m3*qdd1*cos(q2) + 2*l1*lc2*m2*qdd1*cos(q2) + l2*lc3*m3*qdd1*cos(q3) + l3^2*m3*qd1*qd2*sin(2*q2 + 2*q3) + l3^2*m3*qd1*qd3*sin(2*q2 + 2*q3) - 2*l1*lc3*m3*qd1*qd2*sin(q2 + q3) - 2*l1*lc3*m3*qd1*qd3*sin(q2 + q3) - 2*l1*l2*m3*qd1*qd2*sin(q2) - 2*l1*lc2*m2*qd1*qd2*sin(q2) - l2*lc3*m3*qd1*qd3*sin(q3) - 2*l2*lc3*m3*qd1*qd2*sin(2*q2 + q3) - l2*lc3*m3*qd1*qd3*sin(2*q2 + q3) - 2*l2*lc2*m2*qd1*qd2*sin(2*q2) - 2*l3*lc3*m3*qd1*qd2*sin(2*q2 + 2*q3) - 2*l3*lc3*m3*qd1*qd3*sin(2*q2 + 2*q3)