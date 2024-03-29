function [ret] = euler_method(fun, y_0, n, T)

if nargin(fun) ~= 2
 error('fun must take two inputs, t and y.');
end
% How many equations?
m = length(y_0);
% Orient y0 as a row vector
y_0 = reshape(y_0, 1, m);
% More error checking on the function you passed
if ~all(size(y_0) == size(fun(0, y_0)))
 error('You have not passed appropriate fun or y_0.');
end
% Set up the time grid. ***NOTE THE n+1***
tgrid = linspace(0, T, n+1);
% Compute h from the time grid.
h = tgrid(2) - tgrid(1);
% Orient tgrid as a column vector
tgrid = reshape(tgrid, n+1, 1);

Y = zeros(n+1, m);
% Set the initial conditions.
Y(1,:) = y_0;
% Finally, we get to the Euler loop
for i=1:n

 % Store the point in time as a temporary variable
 t_i = tgrid(i);
 
 % Take the Euler step into the temporary variable
 y_1 = y_0 + h * fun(t_i, y_0);

 % Store the Euler step
 Y(i+1,:) = y_1;

 % Update the temporary variable
 y_0 = y_1;

end
ret=Y(end)
