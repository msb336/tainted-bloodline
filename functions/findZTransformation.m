function [ rot ] = findZTransformation( plane )
%FINDZTRANSFORMATION determine transformation matrix (non-homogenous) from
%v1 to z axis
v1 = plane.Normal;
v1 = [v1(:)/norm(v1); 1];

%% Rotation
theta1 = atan(v1(2)/v1(3));
theta1(isnan(theta1)) = 0;
rot1 = [1 0 0 0; ...
    0 cos(theta1) -sin(theta1) 0; ...
    0 sin(theta1) cos(theta1) 0; ...
    0 0 0 1];
v2 = rot1*v1;
theta2 = -atan(v2(1)/v2(3));
theta2(isnan(theta2)) = 0;
rot2 = [cos(theta2) 0 sin(theta2) 0; 0 1 0 0; -sin(theta2) 0 cos(theta2) 0; 0 0 0 1];

rot = rot2*rot1;

end

