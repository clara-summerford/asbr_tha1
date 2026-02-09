%% THA1 - axis angle representation to rotation matrix 

function rot = axisAngleToRot(w, theta)

    w_hat = [0 -w(3) w(2); w(3) 0 -w(1); -w(2) w(1) 0];
    rot = eye(3) + w_hat*sin(theta)+(w_hat^2)*(1-cos(theta)); % Rodriguez' formula
    
end
