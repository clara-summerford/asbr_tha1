%% THA PA2a
axisAngleToRot()
quatToRot()

function axisAngleToRot(w, theta)
    w_hat = cross2Matrix(w);
    rot = eye(3) + w_hat*sin(theta)+(w_hat^2)*(1-cos(theta));
    disp(rot)
end

function quatToRot(Q)
    R1 = [Q(1)^2+Q(2)^2-Q(3)^2-Q(4)^2, 2*(Q(2)*Q(3)-Q(1)*Q(4)), 2*(Q(1)*Q(3)+Q(2)*Q(4))];
    R2 = [2*(Q(1)*Q(4)+Q(2)*Q(3)), Q(1)^2-Q(2)^2+Q(3)^2-Q(4)^2, 2*(Q(3)*Q(4)-Q(1)*Q(2))];
    R3 = [Q(2)^2+Q(4)^2-Q(1)^2-Q(3)^2, 2*(Q(1)*Q(2)+Q(3)*Q(4)), Q(1)^2-Q(2)^2-Q(3)^2+Q(4)^2];
    R = [R1; R2; R3];
    disp(R)
end
    
    