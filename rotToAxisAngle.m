%% THA1 - rotation matrix to axis-angle representation

function [w, theta] = rotToAxisAngle(rot)

    tr = trace(rot);
    theta = acos((tr-1)/2);
    axisCalc = [rot(3,2)-rot(2,3), rot(1,3)-rot(3,1), rot(2,1)-rot(1,2)];
    s_theta = sin(theta);
    w = (1/(2*s_theta))*axisCalc';
    
    %remove after debugging
    disp(w, theta)

end
