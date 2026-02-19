%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% This function checks to see if the user-defined rotation matrix (rot) is
% a valid transformation matrix, i.e., is orthogonal with determinant = +1

function check = isValidRot(rot)

dim = size(rot);

if ~isequal(dim(1),dim(2)) % Checks squareness
    check = false;
    return
end

d = det(rot);
orth = rot*rot';

if ~isequal(d,1) % Checks determinant is +1
    check = false;
elseif ~isequal(orth,eye(3)) % Checks orthogonality
    check = false;
else
    check = true;
end

end

