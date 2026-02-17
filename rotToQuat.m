%% THA1 - rotation matrix to quaternion TESTED

function [Q] = rotToQuat(rot)

    % scalar component
    Q(1) = 0.5*sqrt(rot(1,1)+rot(2,2)+rot(3,3)+1);
    
    % custom sign function to account for x>=0 and not returning 0
    function sign = sgn(x)
        sign = x/abs(x);
        if isnan(sign)
            sign = 1;
        end
    end

    % vector components
    Q(2) = 0.5*sgn(rot(3,2)-rot(2,3))*sqrt(rot(1,1)-rot(2,2)-rot(3,3)+1);
    Q(3) = 0.5*sgn(rot(1,3)-rot(3,1))*sqrt(rot(2,2)-rot(1,1)-rot(3,3)+1);
    Q(4) = 0.5*sgn(rot(2,1)-rot(1,2))*sqrt(rot(3,3)-rot(2,2)-rot(1,1)+1);
    
end