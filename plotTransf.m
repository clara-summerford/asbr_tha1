%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% This function plots a set of Cartesian axes under one of three
% conditions:
% (a) if T0 is a 4x4 identity matrix, plots the frame at (0,0,0) e.g. the
% space frame.
% (b) if T0 is not eye(4) and is the only input, plots the space frame and 
% the frame described by T0 in the space frame
% (c) if both T0 and transf provided, plots the space frame and a new frame 
% given by subjecting T0 to a fixed-frame rgid body transformation
% described by transf.

function plotTransf(T0,transf)

%%% Plot the space frame
% Location of arrow tails (origin) and arrow heads - homogenous representation
O_s = [0 0 0 1]';
x_s = [1 0 0 1]'; 
y_s = [0 1 0 1]';
z_s = [0 0 1 1]';
% Plot space frame
zp(1) = quiver3(O_s(1),O_s(2),O_s(3),x_s(1),x_s(2),x_s(3),'LineWidth',1.5,'MaxHeadSize',2,'Color','r');
hold on
grid on
box on
zp(2) = quiver3(O_s(1),O_s(2),O_s(3),y_s(1),y_s(2),y_s(3),'LineWidth',1.5,'MaxHeadSize',2,'Color','g');
zp(3) = quiver3(O_s(1),O_s(2),O_s(3),z_s(1),z_s(2),z_s(3),'LineWidth',1.5,'MaxHeadSize',2,'Color','b');

% If T0 = 4x4 identity matrix, REWRITE 
check = isequal(T0, eye(4));

% if nargin == 1 && ~check
%     disp('ERROR: Must provide both an initial frame and a transformation. ')
%     disp('To plot the space frame alone, input T0 = eye(4).')
%     return

if nargin == 1 && check
    return

elseif nargin == 1
    %%% Plot new frame (space frame transformed by T0)
    % Extract the origin of frame T0
    O_T = T0*O_s;
    x_T = T0*x_s; % Location of x_hat arrowhead defined in body frame (must adjust below to get space frame)
    y_T = T0*y_s; % Location of y_hat arrowhead defined in body frame (must adjust below to get space frame)
    z_T = T0*z_s; % Location of z_hat arrowhead defined in body frame (must adjust below to get space frame)
    % Plot frame T0
    zp(4) = quiver3(O_T(1),O_T(2),O_T(3),(x_T(1)-O_T(1)),(x_T(2)-O_T(2)),(x_T(3)-O_T(3)),'LineWidth',1.5,'MaxHeadSize',2,'Color','r');
    zp(5) = quiver3(O_T(1),O_T(2),O_T(3),(y_T(1)-O_T(1)),(y_T(2)-O_T(2)),(y_T(3)-O_T(3)),'LineWidth',1.5,'MaxHeadSize',2,'Color','g');
    zp(6) = quiver3(O_T(1),O_T(2),O_T(3),(z_T(1)-O_T(1)),(z_T(2)-O_T(2)),(z_T(3)-O_T(3)),'LineWidth',1.5,'MaxHeadSize',2,'Color','b');

elseif nargin == 2
    %%% Plot new frame (T0 transformed by screw matrix exponential)
    % Extract the origin of frame T0
    O_T = T0(1:4,4);
    x_T = T0*x_s; % Location of x_hat arrowhead defined in body frame (must adjust below to get space frame)
    y_T = T0*y_s; % Location of y_hat arrowhead defined in body frame (must adjust below to get space frame)
    z_T = T0*z_s; % Location of z_hat arrowhead defined in body frame (must adjust below to get space frame)
    
    O_Tf = transf*O_T;
    x_Tf = transf*x_T;
    y_Tf = transf*y_T;
    z_Tf = transf*z_T;

    % Plot frame T0
    zp(4) = quiver3(O_Tf(1),O_Tf(2),O_Tf(3),(x_Tf(1)-O_Tf(1)),(x_Tf(2)-O_Tf(2)),(x_Tf(3)-O_Tf(3)),'LineWidth',1.5,'MaxHeadSize',2,'Color','r');
    zp(5) = quiver3(O_Tf(1),O_Tf(2),O_Tf(3),(y_Tf(1)-O_Tf(1)),(y_Tf(2)-O_Tf(2)),(y_Tf(3)-O_Tf(3)),'LineWidth',1.5,'MaxHeadSize',2,'Color','g');
    zp(6) = quiver3(O_Tf(1),O_Tf(2),O_Tf(3),(z_Tf(1)-O_Tf(1)),(z_Tf(2)-O_Tf(2)),(z_Tf(3)-O_Tf(3)),'LineWidth',1.5,'MaxHeadSize',2,'Color','b');

end


end