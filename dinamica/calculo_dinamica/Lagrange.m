clear 
clc

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


DH = [
0 0 l1 pi/2 0
0 0 l2 0 0  
-pi/2 0 l3 0 0
];

fDegrees = 3;



% J1 = [Ixx1, 0, 0, -(l1-lc1)*m1;0, Iyy1, 0, 0;0, 0, Izz1, 0; -(l1-lc1)*m1 0 0 m1];
% J2 = [Ixx2, 0, 0, -(l2-lc2)*m2;0, Iyy2, 0, 0;0, 0, Izz2, 0; -(l2-lc2)*m2 0 0 m2];
% J3 = [Ixx3, 0, 0, (l3-lc3)*m3;0, Iyy3, 0, 0;0, 0, Izz3, 0; (l3-lc3)*m3 0 0 m3];

% J1 = [Ixx1, 0, 0, -(l1-lc1)*m1; 0, Iyy1, 0, 0; 0, 0, Izz1, 0; -(l1-lc1)*m1 0 0 m1];
% J2 = [Ixx2, 0, 0, -(l2-lc2)*m2; 0, Iyy2, 0, 0; 0, 0, Izz2, 0; -(l2-lc2)*m2 0 0 m2];
% J3 = [Ixx3, 0, 0, (l3-lc3)*m3; 0, Iyy3, 0, 0; 0, 0, Izz3, 0; (l3-lc3)*m3 0 0 m3];

J1 = [0, 0, 0, -(l1-lc1)*m1; 0, 0, 0, 0; 0, 0, 0, 0; -(l1-lc1)*m1 0 0 m1];
J2 = [0, 0, 0, -(l2-lc2)*m2; 0, 0, 0, 0; 0, 0, 0, 0; -(l2-lc2)*m2 0 0 m2];
J3 = [0, 0, 0, -(l3-lc3)*m3; 0, 0, 0, 0; 0, 0, 0, 0; -(l3-lc3)*m3 0 0 m3];

J(:,:,1) = J1;
J(:,:,2) = J2;
J(:,:,3) = J3;

% R = SerialLink(DH);
% q = [sym('q1'), sym('q2'), sym('q3')];
% 
% for i=1:fDegrees
%     R = SerialLink(DH(i,:));
%     R.fkine(sym('q'))
% end

% Rotacion
Qr = [
    0 -1 0 0
    1 0 0 0
    0 0 0 0
    0 0 0 0
];

% Translacion
Qt = [
    0 0 0 0
    0 0 0 0
    0 0 0 1
    0 0 0 0
];

Q(:,:,1) = Qr;
Q(:,:,2) = Qr;
Q(:,:,3) = Qr;

q_dot = [qd1 qd2 qd3];

TransfMatrix(:, :, 1) = [cos(q1), 0, sin(q1), l1*cos(q1); sin(q1), 0, -cos(q1), l1*sin(q1); 0, 1, 0, 0; 0, 0, 0, 1];
TransfMatrix(:, :, 2) = [cos(q2), -sin(q2), 0, l2*cos(q2); sin(q2), cos(q2), 0, l2*sin(q2); 0, 0, 1, 0; 0, 0, 0, 1];
TransfMatrix(:, :, 3) = [cos(q3), -sin(q3), 0, l3*cos(q3); sin(q3), cos(q3), 0, l3*sin(q3); 0, 0, 1, 0; 0, 0, 0, 1];
TransfMatrix(:, :, 4) = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];

U = sym(zeros(4, 4, fDegrees, fDegrees));
for i=1:fDegrees
    for j=1:fDegrees
        Am = sym([1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]);
        AM = sym([1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]);
        for k=1:j-1
            Am = Am * TransfMatrix(:, :, k);
        end
        
        for k=j:i
            AM = AM * TransfMatrix(:, :, k);
        end
        if j>i
            U(:, :, i, j) = [0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0];
        else
            U(:, :, i, j) = Am * Q(:,:,j) * AM;
        end
    
    end
end


Uijk = sym(zeros(4, 4, fDegrees, fDegrees, fDegrees));
for i=1:fDegrees
    for j=1:fDegrees
        for k=1:fDegrees
            A1 = sym([1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]);
            A2 = sym([1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]);
            A3 = sym([1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]);
            if (i >= k) && (k >= j)
                for g=1:j-1
                    A1 = Am * TransfMatrix(:, :, g);
                end
                for g=j:k-1
                    A2 = A2 * TransfMatrix(:, :, g);
                end
                for g=k:i
                    A3 = A3 * TransfMatrix(:, :, g);
                end
                
                Uijk(:, :, i, j, k) = A1 * Q(:,:,j) * A2 * Q(:,:,k) * A3;
                
            elseif (i >= j) && (j >= k)
                for g=1:k-1
                    A1 = Am * TransfMatrix(:, :, g);
                end
                for g=k:j-1
                    A2 = A2 * TransfMatrix(:, :, g);
                end
                for g=j:i
                    A3 = A3 * TransfMatrix(:, :, g);
                end
                Uijk(:, :, i, j, k) = A1 * Q(:,:,k) * A2 * Q(:,:,j) * A3;
                
            elseif k>i || j>i
                Uijk(:, :, i, j, k) = [0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0];
            end
            
        end
    end
end
D = sym(zeros(fDegrees, fDegrees));

for i=1:fDegrees
    for j=1:fDegrees
        for k=max([i,j]):fDegrees
            D(i,j) = D(i,j) + trace(U(: ,: ,k ,j) * J(:,:,k)* U(: ,: ,k ,i).');
        end
         D(i,j) = simplify(D(i,j));
    end
end

Hikm = sym(zeros(fDegrees, fDegrees, fDegrees));

for i=1:fDegrees
    for k=1:fDegrees
        for m=1:fDegrees
            for j=max([i,k,m]):fDegrees
                Hikm(i,k,m) = Hikm(i,k,m) + trace(Uijk(: ,: ,j ,k, m) * J(:,:,j)* U(: ,: ,j ,i).');
            end
            Hikm(i,k,m) = simplify(Hikm(i,k,m));
        end
    end
end

H = sym(zeros(fDegrees, 1));
for i=1: fDegrees
    for k=1:fDegrees
        for m=1:fDegrees
            H(i,1) = H(i,1) + Hikm(i,k,m)*q_dot(k)*q_dot(j);
        end
    end
end

C = sym(zeros(fDegrees, 1));
grav =[0,0,-g,0];
r = [
  -lc1 0 0 1
  -lc2 0 0 1
  lc3 0 0 1 
];
m = [m1, m2, m3];
for i=1: fDegrees
    for j=1:fDegrees
        C(i,1) = C(i,1) + -m(j) * grav * U(:,:,j,i) * r(j,:).';
    end
    C(i,1) = simplify(C(i,1));
end


display(D)
display(H)
display(C)

T = simplify(D * [qdd1; qdd2; qdd3] + H + C)
