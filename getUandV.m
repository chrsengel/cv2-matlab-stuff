function [u,v] = getUandV(P, K, C, R)
    % get the u and v vectors given a point P,
    % the camera Parameters K, center C
    % and a rotation R
    syms uu vv lambda
    PI_0 = [1 0 0 0; 0 1 0 0; 0 0 1 0];
    T = -C;
    g = [R T; 0 0 0 1];
    P = [P; 1];
    eq = lambda * [uu; vv; 1] == K * PI_0 * g * P;
    [u, v, ~] = solve([eq], [uu vv, lambda]);   
end