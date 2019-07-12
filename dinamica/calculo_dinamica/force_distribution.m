syms W

A =[1, 1*cos(2*pi/3), 1*cos(-2*pi/3)
    0, 1*sin(2*pi/3), 1*sin(-2*pi/3)
    1, 1, 1];

simplify(inv(A) * [0; 0; W])