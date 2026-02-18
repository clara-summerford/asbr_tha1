%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% This function takes a user-defined rotation matrix (rot) and returns the axis
% of rotation (w) and the angle (theta) about which the frame is rotated about that
% axis.

function [w, theta] = rotToAxisAngle(rot)

    tr = trace(rot);
    theta = acos((tr-1)/2);
    axisCalc = [rot(3,2)-rot(2,3), rot(1,3)-rot(3,1), rot(2,1)-rot(1,2)];
    s_theta = sin(theta);
    w = (1/(2*s_theta))*axisCalc';
    
end
