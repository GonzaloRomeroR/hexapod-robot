% Simscape(TM) Multibody(TM) version: 5.0

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(7).translation = [0.0 0.0 0.0];
smiData.RigidTransform(7).angle = 0.0;
smiData.RigidTransform(7).axis = [0.0 0.0 0.0];
smiData.RigidTransform(7).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [-35.000000000000291 -60.62177826491056 19.999999999999989];  % mm
smiData.RigidTransform(1).angle = 0;  % rad
smiData.RigidTransform(1).axis = [0 0 0];
smiData.RigidTransform(1).ID = 'B[cama-1:-:pata1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [10.000000000000082 7.5000000000000142 0];  % mm
smiData.RigidTransform(2).angle = 0;  % rad
smiData.RigidTransform(2).axis = [0 0 0];
smiData.RigidTransform(2).ID = 'F[cama-1:-:pata1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [38.500000000000007 20 -7.5000000000000071];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(3).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(3).ID = 'B[pata1-1:-:pata2-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [85.800000000000296 7.4999999999997939 -4.2632564145606011e-14];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897918;  % rad
smiData.RigidTransform(4).axis = [-1 -2.8347158282439431e-31 3.9160205985652555e-16];
smiData.RigidTransform(4).ID = 'F[pata1-1:-:pata2-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [10.000000000000009 7.4999999999999929 0];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'B[pata2-2:-:pata3-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [20.000000000000277 7.4999999999995666 -10.000000000000504];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931966;  % rad
smiData.RigidTransform(6).axis = [-0.5773502691896254 -0.57735026918962606 0.57735026918962584];
smiData.RigidTransform(6).ID = 'F[pata2-2:-:pata3-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [9.0089325209839473 5.3707097721261627 146.87163154393164];  % mm
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = 'RootGround[cama-1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(4).mass = 0.0;
smiData.Solid(4).CoM = [0.0 0.0 0.0];
smiData.Solid(4).MoI = [0.0 0.0 0.0];
smiData.Solid(4).PoI = [0.0 0.0 0.0];
smiData.Solid(4).color = [0.0 0.0 0.0];
smiData.Solid(4).opacity = 0.0;
smiData.Solid(4).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.021008398163397432;  % kg
smiData.Solid(1).CoM = [7.4999999999999991 7.4999999999999947 -52.530234482927639];  % mm
smiData.Solid(1).MoI = [29.232358965399012 29.459258289391265 0.69181530103472266];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'pata3*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.33889930750599889;  % kg
smiData.Solid(2).CoM = [0 0 12.5];  % mm
smiData.Solid(2).MoI = [440.64436708179107 440.64436708179096 835.85508665721341];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'cama*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.022621349540849368;  % kg
smiData.Solid(3).CoM = [47.899999999999999 7.5000000000000027 12.5];  % mm
smiData.Solid(3).MoI = [1.8860145273496518 10.943277774912445 9.9282667710053509];  % kg*mm^2
smiData.Solid(3).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(3).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'pata2*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.012483296326794896;  % kg
smiData.Solid(4).CoM = [24.250000000000004 7.5 -7.4999999999999982];  % mm
smiData.Solid(4).MoI = [0.57938835206944672 2.7575588259369801 2.7575588259369801];  % kg*mm^2
smiData.Solid(4).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(4).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'pata1*:*Predeterminado';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(3).Rz.Pos = 0.0;
smiData.RevoluteJoint(3).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = -130.30463033056566;  % deg
smiData.RevoluteJoint(1).ID = '[cama-1:-:pata1-1]';

smiData.RevoluteJoint(2).Rz.Pos = -111.56163170186309;  % deg
smiData.RevoluteJoint(2).ID = '[pata1-1:-:pata2-2]';

smiData.RevoluteJoint(3).Rz.Pos = -19.89972449420782;  % deg
smiData.RevoluteJoint(3).ID = '[pata2-2:-:pata3-1]';

