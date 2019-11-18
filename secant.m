function [x,err,i] = secant(x0, x1, f, tol, n, show, prec)
%Given 2 initial guesses for x, evaluate f(x) at both and find the root of
%the secant line between the two evaluations. Evaluate the function at this
%root to and use this to form another secant. repeat until each succesive
%iteration falls within the tolerance%
%-------------------------------------------------------------------------
%x0 = first initial guess
%x1 = second initial guess
%f  = function
%tol= tolerance
%n(optional)    = max number of iterations. (default = 100)
%show(optional) = boolean to display each iteration. (deafault = false)
%prec(optional) = precision of the display, not the function. (default = 5)

%set deafult values
if (nargin<=6), prec=5; end
if (nargin<=5), show=false; end
if (nargin==4), n=100; end
%exit function if wrong # of arguments, provide info on input variables
if (nargin<4 ||nargin>7), ex=['secant takes between 4 and 7 arguments' newline 'x0 = first initial guess' newline 'x1 = second initial guess' newline 'f  = function' newline 'tol= tolerance' newline 'n(optional)    = max number of iterations. (default of 100)' newline 'show(optional) = boolean to display each iteration. (deafault of false)']; error(ex); end
%First iteration & error calculation
x(2) = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
err(2)= abs(x(2)-x1);
x(1)=x1;
%display step 1 if show==true
if (show==true), steps=['1- x(i-1):', num2str(x0),'  x(i):', num2str(x1),'  x(i+1):', num2str(x(2)),'  err:', num2str(err(2))]; disp(steps); end

%iterate until the error of the current step is less than the tolerance or
%the max number of iterations n have been reached
i=2;
while (err(i)>tol) && (i<=n)
    x(i+1) = x(i)-f(x(i))*(x(i)-x(i-1))/(f(x(i))-f(x(i-1)));
    err(i+1) = abs(x(i+1)-x(i));
    %display current step
    if (show==true), steps=[num2str(i),'- x(i-1):', num2str(x(i-1), prec),'  x(i):', num2str(x(i), prec),'  x(i+1):', num2str(x(i+1), prec),'  err:', num2str(err(i+1), prec)]; disp(steps); end
    i=i+1;
end

end