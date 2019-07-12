function RNE()

% 
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

% % 
% l1 = 1; l2 = 1; l3 = 1;
% q1 = 2; q2 = 0; q3 = pi/8;
% qd1 = 44; qd2 = 44; qd3 = 44;
% qdd1 = 0.3; qdd2 = 9; qdd3 = 0.01;
% lc1 = l1/2; lc2 = l2/2; lc3 = l3/2;
% 
% Ixx1 = 0.0001; Ixx2 = 0.0001; Ixx3 = 0.0001;
% Iyy1 = 0.0001; Iyy2 = 0.0001; Iyy3 = 0.0001;
% Izz1 = 0.0001; Izz2 = 0.0001; Izz3 = 0.0001;
% 
% g = 9.81;
% m1 = 2; m2 = 2; m3 = 2;




N_DOFS = 3;
dh.theta = [q1 q2 q3];
dh.alpha = [0 0 pi/2];
dh.offset = [0 0 0];
dh.d = [0 0 0];
dh.a = [l1 l2 l3];
dh.type = ['r' 'r' 'r'];

% -------------------------------------------------------------------------

% Set distance to center of mass

rb.I =  repmat(zeros(3), 1, 1, N_DOFS);
rb.m = [m1 m2 m3];
rb.r = [-(l1-lc1) 0 0; -(l2-lc2) 0 0; -(l3-lc3) 0 0]';


qc = [q1; q2; q3];
qcdot = [qd1; qd2; qd3];
qcddot = [qdd1; qdd2; qdd3];


Q = invdyn(dh, rb, qc, qcdot, qcddot, [0; -g; 0]);
simplify(Q)
length(Q)

end



function Q = invdyn(dh, rb, qc, qcdot, qcddot, grav)
% Inverse dynamic with recursive Newton-Euler

if nargin < 6
    grav = [0;0;0];
end

z0 = [0; 0; 1];

for k = 1 : 1  
    q = qc;
    qdot = qcdot;
    qddot = qcddot;

    N_DOFS = length(q);
    
    % ---------------------------------------------------------------------
    % Forward recursion
    for i = 1 : N_DOFS
        T = calc_transformation(i-1, i, dh, q);
        R = T(1:3, 1:3);
        p = [dh.a(i); dh.d(i)*sin(dh.alpha(i)); dh.d(i)*cos(dh.alpha(i))];
        
        if i > 1
            w(:, i) =  R'*(w(:, i-1) + z0.*qdot(i));
            wdot(:, i) = R'*(wdot(:, i-1) +  z0.*qddot(i) + ...
                cross(w(:, i-1), z0.*qdot(i)));
            vdot(:,i) = R'*vdot(:,i-1) + cross(wdot(:,i), p) + ...
                cross(w(:,i), cross(w(:,i),p));
        else
            w(:, i) =  R'*(z0.*qdot(i));
            wdot(:, i) = R'*(z0.*qddot(i));
            vdot(:,i) = R'*grav + cross(wdot(:,i), p) + ...
                cross(w(:,i), cross(w(:,i),p));
        end
    end
    
    % Dynamic simulation
    % Backward recursion
    for i = N_DOFS:-1:1
        p = [dh.a(i); dh.d(i)*sin(dh.alpha(i)); dh.d(i)*cos(dh.alpha(i))];
        
        vcdot = vdot(:,i) + cross(wdot(:,i),rb.r(:,i)) + ...
            cross(w(:,i),cross(w(:,i),rb.r(:,i)));
        
        F = rb.m(i)*vcdot;
        N = rb.I(:,:,i)*wdot(:,i)+cross(w(:,i),rb.I(:,:,i)*w(:,1));
        
        if i < N_DOFS
            T = calc_transformation(i, i+1, dh, q);
            R = T(1:3, 1:3);
            n(:,i) = R*(n(:,i+1) + cross(R'*p, f(:,i+1))) + ...
                cross(rb.r(:,i)+p,F) + N;
            f(:,i) = R*f(:,i+1) + F;
        else
            n(:,i) = cross(rb.r(:,i)+p,F) + N;
            f(:,i) = F;
        end
        
        T = calc_transformation(i-1, i, dh, q);
        R = T(1:3, 1:3);
        
        if dh.type(i) == 't'
            Q(i,k) = f(:,i)'*R'*z0;
        elseif dh.type(i) == 'r'
            Q(i,k) = n(:,i)'*R'*z0;
        end
    end
end
end

% -------------------------------------------------------------------------
function  T = calc_transformation(from, to, dh, qc)
% Transformation from one joint to another joint
% 0<=from<N_DOFS
% 0<to<=N_DOFS

T = eye(4);
N_DOFS = length(qc);

% Sanity check
if (from >= N_DOFS) || (from < 0) || (to <= 0) || (to >  N_DOFS)
    return;
end

for i = from+1 : to
    if dh.type(i) == 'r'
        dh.theta(i) = qc(i);
    elseif dh.type(i) == 'p'
        dh.d(i) = qc(i);
    end
    
    ct = cos(dh.theta(i) + dh.offset(i));
    st = sin(dh.theta(i) + dh.offset(i));
    ca = cos(dh.alpha(i));
    sa = sin(dh.alpha(i));
    
    T = T * [ ct    -st*ca   st*sa     dh.a(i)*ct ; ...
              st    ct*ca    -ct*sa    dh.a(i)*st ; ...
              0     sa       ca        dh.d(i)    ; ...
              0     0        0         1          ];
end

end