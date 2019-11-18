function [approx] = simpson(f,a,b,n)
h=(b-a)/(n-1);
xi=a:h:b;
approx= h/3*(f(xi(1))+f(xi(end))+4*sum(f(xi(2:2:end)))+2*sum(f(xi(3:2:end-2))));
end


