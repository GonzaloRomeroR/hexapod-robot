clc
l1 = 0.0285 * 1000; l2 = 0.0758 * 1000; l3 = 0.1298 * 1000;

T = pi/16;
size = 600

q2_array = zeros(1, size + 1);
q3_array = zeros(1, size + 1);
t = ones(1, size + 1);
det_array = ones(1, size + 1);
contador = 0;
for q3=-pi:T:pi
    for q2=-pi:T:pi
        contador = contador + 1;
        q2_array(contador) = q2;
        q3_array(contador) = q3;
        t(contador) = contador;
        det_array(contador) = -l2*l3*(l1*sin(q3) - l3*sin(q2) + l2*cos(q2)*sin(q3) + l3*cos(q3)^2*sin(q2) + l3*cos(q2)*cos(q3)*sin(q3));
    end
end

%stem(t, det_array)

for i=1:size + 1
    if abs(det_array(i)) < 1e-1
        fprintf('q2: %f, q3: %f\n', q2_array(i), q3_array(i));
    end
end
        