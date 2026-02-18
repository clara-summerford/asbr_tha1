%% THA1 - rotation matrix to axis-angle representation

function [w, theta] = rotToAxisAngle(rot)

    tr = trace(rot);
    
    % checking first if the rotation matrix is an identity matrix 
    if rot == eye(3)
        theta = 0;
        fprintf("Error: Identity rotation matrix, w is undefined!")

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
