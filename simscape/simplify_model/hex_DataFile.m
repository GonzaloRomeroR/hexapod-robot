% Simscape(TM) Multibody(TM) version: 5.0

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(5).translation = [0.0 0.0 0.0];
smiData.RigidTransform(5).angle = 0.0;
smiData.RigidTransform(5).axis = [0.0 0.0 0.0];
smiData.RigidTransform(5).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [-76.016531496425344 -57.148864540090393 166.87163154393158];  % mm
smiData.RigidTransform(1).angle = 1.4572890252110697;  % rad
smiData.RigidTransform(1).axis = [0 0 -1];
smiData.RigidTransform(1).ID = 'AssemblyGround[Ensamblaje2-1:pata1-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-77.618685410387855 -87.239311350173807 168.26431860791723];  % mm
smiData.RigidTransform(2).angle = 1.9505885041892213;  % rad
smiData.RigidTransform(2).axis = [-0.59345372878721425 0.61429007544912506 -0.5200580496379803];
smiData.RigidTransform(2).ID = 'AssemblyGround[Ensamblaje2-1:pata2-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [-64.1547689416998 -161.20187813635044 157.12585428731197];  % mm
smiData.RigidTransform(3).angle = 1.4220116536239462;  % rad
smiData.RigidTransform(3).axis = [-0.99621535830111252 -0.056599640322472014 0.065965450050409241];
smiData.RigidTransform(3).ID = 'AssemblyGround[Ensamblaje2-1:pata3-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-32.432157075542229 -5.6132579553811803 146.87163154393167];  % mm
smiData.RigidTransform(4).angle = 0;  % rad
smiData.RigidTransform(4).axis = [0 0 0];
smiData.RigidTransform(4).ID = 'AssemblyGround[Ensamblaje2-1:cama-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [-174.36182029995567 -37.746753560975925 380.14857015833246];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'RootGround[Ensamblaje2-1]';


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
smiData.Solid(1).mass = 0.012483296326794895;  % kg
smiData.Solid(1).CoM = [24.25 7.5 -7.4999999999999982];  % mm
smiData.Solid(1).MoI = [0.57938835206944672 2.7575588259369805 2.7575588259369805];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'pata1*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.022621349540849368;  % kg
smiData.Solid(2).CoM = [47.899999999999999 7.5000000000000027 12.5];  % mm
smiData.Solid(2).MoI = [1.8860145273496522 10.943277774912445 9.9282667710053509];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'pata2*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.021008398163397429;  % kg
smiData.Solid(3).CoM = [7.4999999999999991 7.4999999999999964 -52.530234482927646];  % mm
smiData.Solid(3).MoI = [29.232358965399008 29.459258289391261 0.69181530103472255];  % kg*mm^2
smiData.Solid(3).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(3).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'pata3*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.33889930750599889;  % kg
smiData.Solid(4).CoM = [0 0 12.499999999999998];  % mm
smiData.Solid(4).MoI = [440.64436708179107 440.64436708179096 835.85508665721341];  % kg*mm^2
smiData.Solid(4).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(4).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'cama*:*Predeterminado';

