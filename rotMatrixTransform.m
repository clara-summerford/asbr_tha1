%% THA1 PA1 

function rotMatrixTransform(rot)
% to return instead, include [w, theta] =

    % rotation matrix to axis-angle representation
    tr = trace(rot);
    theta = acos((tr-1)/2);
    axisCalc = [rot(3,2)-rot(2,3), rot(1,3)-rot(3,1), rot(2,1)-rot(1,2)];
    s_theta = sin(theta);
    w = (1/(2*s_theta))*axisCalc';

    fprintf("Axis: \n")
    fprintf("%g\n", w)
    fprintf("Angle: %f\n", theta)

    %rotation matrix to quaternion
    Q = [cos(theta/2); w*sin(theta/2)];
    fprintf("Quaternion: \n")
    disp(Q)

    %rotation matrix to ZYZ Euler angles, RPY
    beta = atan2(sqrt(rot(3,1)^2+rot(3,2)^2), rot(3,3));
    s_beta = sin(beta);
    alpha = atan2(rot(2,3)/s_beta, rot(1,3)/s_beta);
    gamma = atan2(rot(3,2)/s_beta, -rot(3,1)/s_beta);
    
    fprintf("ZYZ Euler Angles: \n")
    fprintf("Alpha: %f\n", alpha)
    fprintf("Beta: %f\n", beta)
    fprintf("Gamma: %f\n", gamma)

    % IN PROGRESS: rotation matrix to ZYX Euler angles (RPY)

    % IF beta is in (-pi/2, pi/2) range (not sure how to code this)
    beta = atan2(-rot(3,1), sqrt(rot(3,2)^2+rot(3,3)^2));
    %s_beta = sin(beta);
    alpha = atan2(rot(2,1)/s_beta, rot(1,1)/s_beta);
    gamma = atan2(rot(3,2)/s_beta, rot(3,3)/s_beta);

    % IF beta is in (pi/2, 3*pi/2) range
    beta = atan2(-rot(3,1), -sqrt(rot(3,2)^2+rot(3,3)^2));
    %s_beta = sin(beta);
    alpha = atan2(-rot(2,3)/s_beta, -rot(1,3)/s_beta);
    gamma = atan2(-rot(3,2)/s_beta, -rot(3,3)/s_beta);
    
    fprintf("ZYX Euler Angles: \n")
    fprintf("Alpha: %f\n", alpha)
    fprintf("Beta: %f\n", beta)
    fprintf("Gamma: %f\n", gamma)

end
