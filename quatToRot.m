%% THA1 - quaternion to rotation matrix
% Do we need to write something to check if theta is given in degrees or
% radians? Or just a comment saying "only accepts radians"?

function rot = quatToRot(Q)

    R1 = [Q(1)^2+Q(2)^2-Q(3)^2-Q(4)^2, 2*(Q(2)*Q(3)-Q(1)*Q(4)), 2*(Q(1)*Q(3)+Q(2)*Q(4))];
    R2 = [2*(Q(1)*Q(4)+Q(2)*Q(3)), Q(1)^2-Q(2)^2+Q(3)^2-Q(4)^2, 2*(Q(3)*Q(4)-Q(1)*Q(2))];
    R3 = [Q(2)^2+Q(4)^2-Q(1)^2-Q(3)^2, 2*(Q(1)*Q(2)+Q(3)*Q(4)), Q(1)^2-Q(2)^2-Q(3)^2+Q(4)^2];
    rot = [R1; R2; R3];

    %remove after debugging
    disp(rot)

end
    
    