%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% This function takes a user-defined rotation matrix (rot) and returns the axis
% of rotation (w) and the angle (theta) about which the frame is rotated about that
% axis.

function [w, theta] = rotToAxisAngle(rot)

    % Check if the input is a valid rotation matrix
    check = isValidRot(rot);
    if check == 0
        disp('ERROR: Not a valid rotation matrix')
        return
    end

    tr = trace(rot);
    
    % checking first if the rotation matrix is an identity matrix 
    if rot == eye(3)
        theta = 0;
        fprintf("ERROR: Identity rotation matrix, w is undefined!")

    elseif tr == -1
        theta = pi;
        % first option from lectures 
        w = (1/sqrt(2*(1+rot(3,3))))*[rot(1,3); rot(2,3); 1 + rot(3,3)]; 
    
    else 
        theta = acos((tr-1)/2);
        w_skew = (1/(2*sin(theta)))*(rot-rot');

        % transforming skew-symmetric representation back to vector 
        w = [w_skew(3,2); w_skew(1,3); w_skew(2,1)];
    end
    
end
