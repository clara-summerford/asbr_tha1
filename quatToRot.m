%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
% Returns a 3x3 rotation matrix based on an input unit quaternion Q

function rot = quatToRot(Q)

    if ~isequal(size(Q), [1,4]) && ~isequal(size(Q), [4,1])
        error('Error: input is not a quaternion!')
    end

    %checking if the input is a unit quaternion and normalizing if it is not
    mag = sqrt(Q(1)^2+Q(2)^2+Q(3)^2+Q(4)^2);
    if mag ~= 1
        Q = Q/mag;    
    end 

    R1 = [Q(1)^2+Q(2)^2-Q(3)^2-Q(4)^2, 2*(Q(2)*Q(3)-Q(1)*Q(4)), 2*(Q(1)*Q(3)+Q(2)*Q(4))];
    R2 = [2*(Q(1)*Q(4)+Q(2)*Q(3)), Q(1)^2-Q(2)^2+Q(3)^2-Q(4)^2, 2*(Q(3)*Q(4)-Q(1)*Q(2))];
    R3 = [2*(Q(2)*Q(4)-Q(1)*Q(3)), 2*(Q(1)*Q(2)+Q(3)*Q(4)), Q(1)^2-Q(2)^2-Q(3)^2+Q(4)^2];
    rot = [R1; R2; R3];

end
    
    