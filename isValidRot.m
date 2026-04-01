%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% This function checks to see if the user-defined rotation matrix (rot) is
% a valid transformation matrix, i.e., is orthogonal with determinant = +1

function test = isValidRot(rot)

    dim = size(rot);
    
    if ~isequal(dim(1),dim(2)) % Checks squareness
        check = false;
        return
    end
    
    d = det(rot);
    orth = rot*rot';
    
    % Check for validity
    tol = 1e-10; % tolerance added to account for difference between 0 and 0.000
    assert(all(abs(d - 1) < tol, 'all'), "Determinant is not equal to +1!");
    assert(all(abs(orth - eye(3)) < tol, 'all'), "Rotation matrix is not orthogonal!");

    
    if ((abs(d - 1)) < tol) && (all(abs(orth - eye(3)) < tol,'all'))
        test = true;
        disp('Test PASSED')
    else
        test = false;
    end

end

