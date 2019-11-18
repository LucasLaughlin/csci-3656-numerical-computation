function [approx] = centralDiff(f,x,h)
approx = (f(x+h)-f(x-h))/(2*h);
end
