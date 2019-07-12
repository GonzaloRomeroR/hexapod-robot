
l1 = 1; l2 = 1; l3 = 1;
q1 = 3; q2 = 0; q3 = 50;
qd1 = 0.1; qd2 = 1; qd3 = -1;
qdd1 = 0.3; qdd2 = 9; qdd3 = 0.01;
lc1 = l1/2; lc2 = l2/2; lc3 = l3/2;

Ixx1 = 0.0001; Ixx2 = 0.0001; Ixx3 = 0.0001;
Iyy1 = 0.0001; Iyy2 = 0.0001; Iyy3 = 0.0001;
Izz1 = 0.0001; Izz2 = 0.0001; Izz3 = 0.0001;

g = 9.81;
m1 = 2; m2 = 2; m3 = 2;

a = - l2^2*m3*qd1*qd2*sin(2*q2)  - lc3^2*m3*qd1*qd2*sin(2*q2 + 2*q3) - lc3^2*m3*qd1*qd3*sin(2*q2 + 2*q3) - 2*l1*lc3*m3*qd1*qd2*sin(q2 + q3) - 2*l1*lc3*m3*qd1*qd3*sin(q2 + q3) - 2*l1*l2*m3*qd1*qd2*sin(q2) - l2*lc3*m3*qd1*qd3*sin(q3) - 2*l2*lc3*m3*qd1*qd2*sin(2*q2 + q3) - l2*lc3*m3*qd1*qd3*sin(2*q2 + q3)
 

 
b =  + (lc3^2*m3*qd1*qd2*sin(q2))/2 + (lc3^2*m3*qd1*qd3*sin(q3))/2 - (lc3^2*m3*qd1*qd2*sin(q2 + 2*q3))/2 - (lc3^2*m3*qd1*qd3*sin(2*q2 + q3))/2  - (l2^2*m3*qd1*qd2*sin(2*q2))/2  - (lc3^2*m3*qd1*qd2*sin(2*q2 + 2*q3))/2 - (lc3^2*m3*qd1*qd3*sin(2*q2 + 2*q3))/2 - l1*lc3*m3*qd1*qd2*sin(q2 + q3) - l1*lc3*m3*qd1*qd3*sin(q2 + q3) - (l2*lc3*m3*qd1*qd2*sin(q2 + q3))/2 - l1*l2*m3*qd1*qd2*sin(q2) - l1*lc3*m3*qd1*qd2*sin(q3) - l1*lc3*m3*qd1*qd3*sin(q2) - (l2*lc3*m3*qd1*qd3*sin(q3))/2 + (l2*lc3*m3*qd1*qd2*sin(q2 - q3))/2 - l2*lc3*m3*qd1*qd2*sin(2*q2 + q3) - (l2*lc3*m3*qd1*qd3*sin(2*q2 + q3))/2 - (l2*lc3*m3*qd1*qd3*sin(2*q2))/2
 