%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% This function takes a user-defined screw axis defined by angular velocity 
% vector(w), linear velocity vector (v), and distance traveled along 
% that axis (theta) and returns the screw matrix exponential (S_exp) -
% i.e., e^(S_mat*theta)

function [S_exp] = calcScrewMatExp(w,v,theta)

% Get skew-symmetric representation of w
w_hat = vec2SkewSym(w);

% Use Rodriguez' formula to compute the rotational component of S_exp
rod = eye(3) + sin(theta)*w_hat + (1-cos(theta))*w_hat^2; % Rodriguez' formula

% Calculate the translational component of S_exp
star = (eye(3)*theta + (1-cos(theta))*w_hat + (theta-sin(theta))*w_hat^2)*v;

% Combine to form S_exp
S_exp = [rod star; 0 0 0 1];

end
