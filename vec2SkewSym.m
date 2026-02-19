%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% Returns a the skew-symmetric representation of an input vector (vec)

function skew_sym = vec2SkewSym(vec)
   skew_sym = [0 -vec(3) vec(2); vec(3) 0 -vec(1); -vec(2) vec(1) 0];

end

