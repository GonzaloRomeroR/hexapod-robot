clc
clear all
close all

% dh = [ 0 0 10 -pi/2 0;
% 0 0 10 0 0;
% -pi/2 0 20 0 0];

dh = [ 0 -10 0 -pi/2 0;
0 0 10 0 0;
-pi/2 0 20 0 0];
miLink = SerialLink(dh,'name','Hexapodo');
%Rango angular de las articulaciones
miLink.links(1).qlim=[ 0 pi];
miLink.links(2).qlim=[ 0 pi];
miLink.links(3).qlim=[ 0 pi];
%offsets o Ceros de cada coordenada articular
miLink.offset = [0 -pi/2 -140*pi/180];
% Posición inicial (medido desde offset)
q = [0 0 0];
axisbox = [-50, 50, -50, 50, -50, 50];
% plot modelo 3D:
miLink.plot(q,'workspace',axisbox,'scale',1)
miLink.teach;
hold on;
jump = 30*pi/180;
% for q1 = miLink.qlim(1,1) : jump : miLink.qlim(1,2)
%     for q2 = miLink.qlim(2,1) : jump : miLink.qlim(2,2)
%         for q3 = miLink.qlim(3,1) : jump : miLink.qlim(3,2)
%             q = [q1 q2 q3];
%             qprint = double(miLink.fkine(q));
%             qp = [qprint(1,4); qprint(2,4); qprint(3,4)];
%             plot3(qp(1), qp(2), qp(3), 'b.');
%         end
%     end
% end
hold off;