function [approx] = backDiff(f,x,h)
approx = (f(x)-f(x-h))/h;
end

