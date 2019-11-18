function [v] = vandermonde(n,d)
% Takes the degree of a polynomial (d) and the number of points to
% evaluate (n) and creates a vandermonde matrix for equally spaced n points
% from -1 to 1
%-------------------------------------------------------------------------
% n - numbner of points
% d - degree of polynomial

x = linspace(-1,1,n)';
v=x.^(0);
for i = 1:d
    v = [v, x.^(i)];
end
end
    
