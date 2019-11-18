function [approx] = forwardDiff(f,x,h)
approx = (f(x+h)-f(x))/h;
end

