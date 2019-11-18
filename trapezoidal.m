function [approx] = trapezoidal(f,a,b,n)
x=a:(b-a)/(n-1):b;
y=f(x);
approx=trapz(x,y);
end

