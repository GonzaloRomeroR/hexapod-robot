%Modelo dinámico mediante implementación de algoritmo Lagrange Euler
%Definición de variables simbólicas
% syms t g;
% syms q1 q2 q3;
% syms qdd1 qdd2 qdd3;
% syms lc1 lc2 lc3;
% syms qd1 qd2 qd3;
% syms m1 m2 m3;
% syms l1 l2 l3;

lc1 = l1; lc2 = l2; lc3 = l3;


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


g_g=[0 0 -g 0];

w=[qd1;qd2;qd3];
m_m=[m1;m2;m3];

J_j=zeros(4,4,3,1);
thet=[q1;q2; q3];

U=zeros(4,4,3,3);
%Matriz D
D_e=zeros(3);
%Matriz c
c=[0;0;0];
%Distancia centro de masa de cada eslabón
r=zeros(4,1,3);
r1=[-(l1 - lc1);0;0;1];
r2=[-(l2 - lc2);0;0;1];
r3=[-(l3 - lc3);0;0;1];

r(:,1,1)=r1;
r(:,1,2)=r2;
r(:,1,3)=r3;
%Vector Aceleración angular
q_dot_dot=[qdd1;qdd2;qdd3];
%Matrices de transformación D-H


A_01 = [cos(q1), 0, sin(q1), l1*cos(q1); sin(q1), 0, -cos(q1), l1*sin(q1); 0, 1, 0 0; 0 0 0 1];
A_12 = [cos(q2), -sin(q2), 0,  l2*cos(q2); sin(q2), cos(q2), 0,l2*sin(q2); 0, 0, 1 0; 0 0 0 1];
A_23 = [cos(q3), -sin(q3), 0,  l3*cos(q3); sin(q3), cos(q3), 0, l3*sin(q3); 0, 0, 1 0; 0 0 0 1];

A_02=A_01*A_12;
A_03=A_02*A_23;

A=zeros(4,4,3,1);
A(:,:,1,1)=A_01;
A(:,:,1,2)=A_02;
A(:,:,1,3)=A_03;
%%Matrices de

J1 = [0, 0, 0, (l1-lc1)*m1; 0, 0, 0, 0; 0, 0, 0, 0; (l1-lc1)*m1 0 0 m1];
J2 = [0, 0, 0, (l2-lc2)*m2; 0, 0, 0, 0; 0, 0, 0, 0; (l2-lc2)*m2 0 0 m2];
J3 = [0, 0, 0, (l3-lc3)*m3; 0, 0, 0, 0; 0, 0, 0, 0; (l3-lc3)*m3 0 0 m3];
%%Pseudoinercias


J_j(:,:,1,1)=J1;
J_j(:,:,1,2)=J2;
J_j(:,:,1,3)=J3;

for i=1:3
for j=1:3
U(:,:,i,j)=diff(A(:,:,1,i),thet(j));
end
end
U_u=zeros(4,4,3,3,3);
for i=1:3
for j=1:3
for k=1:3
U_u(:,:,i,j,k)=diff(U(:,:,i,j),thet(k));
end
end
end
for i=1:3
for j=1:3
for k=max(i,j):3
D_e(i,j)= D_e(i,j) + trace( U(:,:,k,j)*J_j(:,:,1,k)*(U(:,:,k,i).'));
end
end
end
%Matrices auxiliares
h=sym(zeros(3,3,3));
for i=1:3
for k=1:3
for m=1:3
for j=max(i,max(k,m)):3
h(i,k,m) = h(i,k,m) + trace(U_u(:,:,j,k,m)*J_j(:,:,1,j)*(U(:,:,j,i).'));
end
end
end
end
%Matriz H

H=sym([0;0;0]);
for i=1:3
for k=1:3
for m=1:3
H(i) = H(i) + h(i,k,m)*w(k)*w(m);
end
end
end
for k=1:3
for j=1:3
c(k) = c(k) - (m_m(j)* g_g *( U(:,:,j,k)*r(:,1,j)));
end
end
%Modelo Dinámico final
T_LE=simplify(sym(D_e*q_dot_dot + H + c))