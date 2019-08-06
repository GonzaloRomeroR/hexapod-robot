


q1 = -1.0472 *3;
q2 = (-1.173 -1.0472)/2 *3;
q3 = -1.173*3;
q4 = (-1.173 -1.0472)/2*3;
q5 = -1.0472*3;

T = 0.01;

offset = pi/2;

q1 = q1 + offset;
q2 = q2 + offset;
q3 = q3 + offset;
q4 = q4 + offset;
q5 = q5 + offset;

t_max = 2;

size = t_max / T;

t1 = 0 : T : t_max/4 - T;
t2 = t_max / 4 : T : 2 * t_max / 4 - T;
t3 = 2 * t_max/4 : T : 3 * t_max/4 - T;
t4 = 3 * t_max/4 : T : 4 * t_max/4 - T;


[q1,qd1,qdd1] = jtraj(q1, q2, t1);
[q2,qd2,qdd2] = jtraj(q2, q3, t1);
[q3,qd3,qdd3] = jtraj(q3, q4, t1);
[q4,qd4,qdd4] = jtraj(q4, q5, t1);

for i = 1: size / 4
    t2(i) = t1(i) + t_max / 4;
    t3(i) = t1(i) + 2 * t_max / 4;
    t4(i) = t1(i) + 3 * t_max / 4;
end

q = cat(1, q1, q2, q3, q4);
qdd_1 = cat(1, qdd1, qdd2, qdd3, qdd4);
t = cat(2, t1, t2, t3, t4);

%%
q1 = -pi/2;
q2 = -pi/2;
q3 = -pi/2;
q4 = -2.2652;
q5 = -pi/2;

T = 0.01;

t_max = 2;

size = t_max / T;

t1 = 0 : T : t_max/4 - T;
t2 = t_max / 4 : T : 2 * t_max / 4 - T;
t3 = 2 * t_max/4 : T : 3 * t_max/4 - T;
t4 = 3 * t_max/4 : T : 4 * t_max/4 - T;


[q1,qd1,qdd1] = jtraj(q1, q2, t1);
[q2,qd2,qdd2] = jtraj(q2, q3, t1);
[q3,qd3,qdd3] = jtraj(q3, q4, t1);
[q4,qd4,qdd4] = jtraj(q4, q5, t1);

for i = 1: size / 4
    t2(i) = t1(i) + t_max / 4;
    t3(i) = t1(i) + 2 * t_max / 4;
    t4(i) = t1(i) + 3 * t_max / 4;
end

q = cat(1, q1, q2, q3, q4);
qdd_2 = cat(1, qdd1, qdd2, qdd3, qdd4);
t = cat(2, t1, t2, t3, t4);

%%



q1 = 0;
q2 = -0.036/2;
q3 = -0.036;
q4 = 0.543;
q5 = 0;

offset = pi/2;

q1 = q1 + offset;
q2 = q2 + offset;
q3 = q3 + offset;
q4 = q4 + offset;
q5 = q5 + offset;

T = 0.01;

t_max = 2;

size = t_max / T;

t1 = 0 : T : t_max/4 - T;
t2 = t_max / 4 : T : 2 * t_max / 4 - T;
t3 = 2 * t_max/4 : T : 3 * t_max/4 - T;
t4 = 3 * t_max/4 : T : 4 * t_max/4 - T;


[q1,qd1,qdd1] = jtraj(q1, q2, t1);
[q2,qd2,qdd2] = jtraj(q2, q3, t1);
[q3,qd3,qdd3] = jtraj(q3, q4, t1);
[q4,qd4,qdd4] = jtraj(q4, q5, t1);

for i = 1: size / 4
    t2(i) = t1(i) + t_max / 4;
    t3(i) = t1(i) + 2 * t_max / 4;
    t4(i) = t1(i) + 3 * t_max / 4;
end

q = cat(1, q1, q2, q3, q4);
qdd_3 = cat(1, qdd1, qdd2, qdd3, qdd4);
t = cat(2, t1, t2, t3, t4);