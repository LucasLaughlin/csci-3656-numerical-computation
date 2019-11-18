function [x,rel,i] = newton(x0, f, df, tol, n, show, prec)
%Newton Root Finding: given an intial guess, find the root for the tangent
%line at that x-value and repeat.
%-------------------------------------------------------------------------
%x0  = initial guess
%f   = function
%df  = dervitive of f
%tol = tolerance
%n(optional)    = max number of iterations. (default = 100)
%show(optional) = boolean to display each iteration. (default = false)
%prec(optional) = precision of the display, not the function. (default = 5)

%set default values
if (nargin<=6), prec=5;end
if (nargin<=5), show=false;end
if (nargin==4), n=100;end
%exit function if wrong # of arguments, provide info on input variables
if (nargin<4 ||nargin>7), ex = ['newton takes between 4 and 7 arguments:' newline 'x0 = initial guess' newline 'f  = function' newline 'df  = dervitive of f' newline 'tol = tolerance' newline 'n(optional)    = max number of iterations. (default = 100)' newline 'show(optional) = boolean to display each iteration. (default = false)' newline 'prec(optional) = precision of the display, not the function. (default = 5)']; error(ex); end
%first iteration of Newton method
x(1)=x0 - (f(x0)/df(x0));
rel(1) = abs(x(1)-x0);
%print initial guess and first iteration if show=true
if (show==true), steps=['0- x: ' num2str(x0) newline '1- x: ' num2str(x(1)) 'err: ' num2str(rel(1))]; disp(steps); end

%iterate until the error of the current step is smaller than the tolerance
%or the max number of iterations n has been reached
i = 2;
while (rel(i-1)>=tol) && (i<=n)
    x(i)=x(i-1) - f(x(i-1))/df(x(i-1));
    rel(i) = abs(x(i)-x(i-1));
    %display current step if show==true
    if (show==true), steps=[num2str(i) '- x: ', num2str(x(i), prec), ' err: ', num2str(rel(i), prec)]; disp(steps); end
    i=i+1;
end
i=i-1;
end