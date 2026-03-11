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
% described by "transf".
%
% The input "scale" allows the user to scale the size of the coordinate
% axes based on the workspace size/units used. A good rule of thumb is a
% tenth of the order of magnitude of the input positions (for example, if
% frame is at position (1,1,1), scale=0.1 would likely be adequate).
%
% The input "lim" allows the user to specify a workspace radius, so that
% the plotted coordinates can always be visualized clearly.

function plotTransf(T0,scale,lim,transf)
    
    %%% Plot the space frame
    % Location of arrow tails (origin) and arrow heads - homogenous representation
    O_s = [0 0 0 1]';
    x_s = [1 0 0 1]'; 
    y_s = [0 1 0 1]';
    z_s = [0 0 1 1]';
    % Plot space frame
    zp(1) = quiver3(O_s(1),O_s(2),O_s(3),x_s(1)*scale,x_s(2)*scale,x_s(3)*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','r');
    hold on
    grid on
    box on
    xlim([-lim,lim])
    ylim([-lim,lim])
    zlim([-lim,lim])
    zp(2) = quiver3(O_s(1),O_s(2),O_s(3),y_s(1)*scale,y_s(2)*scale,y_s(3)*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','g');
    zp(3) = quiver3(O_s(1),O_s(2),O_s(3),z_s(1)*scale,z_s(2)*scale,z_s(3)*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','b');
    lgd = legend('X', 'Y', 'Z');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    lgd.AutoUpdate = 'off';
    
    % If T0 = 4x4 identity matrix, return
    check = isequal(T0, eye(4));
    
    if nargin == 3 && check
        return
    
    elseif nargin == 3
        %%% Plot new frame (space frame transformed by T0)
        % Extract the origin of frame T0
        O_T = T0*O_s;
        x_T = T0*x_s; % Location of x_hat arrowhead defined in body frame (must adjust below to get space frame)
        y_T = T0*y_s; % Location of y_hat arrowhead defined in body frame (must adjust below to get space frame)
        z_T = T0*z_s; % Location of z_hat arrowhead defined in body frame (must adjust below to get space frame)
        % Plot frame T0
        zp(4) = quiver3(O_T(1),O_T(2),O_T(3),(x_T(1)-O_T(1))*scale,(x_T(2)-O_T(2))*scale,(x_T(3)-O_T(3))*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','r');
        zp(5) = quiver3(O_T(1),O_T(2),O_T(3),(y_T(1)-O_T(1))*scale,(y_T(2)-O_T(2))*scale,(y_T(3)-O_T(3))*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','g');
        zp(6) = quiver3(O_T(1),O_T(2),O_T(3),(z_T(1)-O_T(1))*scale,(z_T(2)-O_T(2))*scale,(z_T(3)-O_T(3))*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','b');
    
    elseif nargin == 4
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
        zp(4) = quiver3(O_Tf(1),O_Tf(2),O_Tf(3),(x_Tf(1)-O_Tf(1))*scale,(x_Tf(2)-O_Tf(2))*scale,(x_Tf(3)-O_Tf(3))*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','r');
        zp(5) = quiver3(O_Tf(1),O_Tf(2),O_Tf(3),(y_Tf(1)-O_Tf(1))*scale,(y_Tf(2)-O_Tf(2))*scale,(y_Tf(3)-O_Tf(3))*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','g');
        zp(6) = quiver3(O_Tf(1),O_Tf(2),O_Tf(3),(z_Tf(1)-O_Tf(1))*scale,(z_Tf(2)-O_Tf(2))*scale,(z_Tf(3)-O_Tf(3))*scale,'LineWidth',1.5,'MaxHeadSize',2,'Color','b');
    
        % % Plot a connecting line between the origins
        %plot3([O_T(1) O_Tf(1)],[O_T(2) O_Tf(2)],[O_T(3) O_Tf(3)],'m')
        
    end


end