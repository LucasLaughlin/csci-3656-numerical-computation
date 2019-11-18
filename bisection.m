function [c ,err,i] = bisection(a, b, f, tol, n, show, prec)
%Continually slice the Domain of the function in two until the midpoint is
%within the tolerance of the actual root
%-------------------------------------------------------------------------
%a   = beginning of interval [a,b]
%b   = end of interval [a,b]
%f   = function
%tol = tolerance
%n(optional)    = max number of iterations. (default = 100)
%show(optional) = boolean to display each iteration. (default = false)
%prec(optional) = precision of the display, not the function. (default = 5)

%set default values
if (nargin<=6), prec=5;end
if (nargin<=5), show=false;end
if (nargin==4), n=100;end
%exit function if wrong # of arguments, provide info on input variables
if (nargin<4 ||nargin>7), ex = ['newton takes between 4 and 7 arguments:' newline 'a   = beginning of interval [a,b]' newline 'b   = end of interval [a,b]' newline 'f  = function' newline 'tol = tolerance' newline 'n(optional)    = max number of iterations. (default = 100)' newline 'show(optional) = boolean to display each iteration. (default = false)' newline 'prec(optional) = precision of the display, not the function. (default = 5)']; error(ex); end
%a and b must be on oposite sides of the root
if (f(a)*f(b)>0), error('f(a)*f(b) must be less than 0'); end
 
%iterate through method until the size of [a,b] is within tolerance or
%maximum iterations n has been reached
i=0;
step=[];
while((b-a) > tol)  && (i<=n)
    %c = midpoint
    i=i+1;
    c(i) = (a+b)/2;
    err(i)=b-a;
    %Build first portion of step to display
    if (show==true),step=['step ', num2str(i), '  a: ',num2str(a,prec),' b: ',num2str(b,prec),' f(a): ',num2str(f(a),prec),' f(b): ',num2str(f(b),prec),' c: ', num2str(c(i),prec),' f(c): ',num2str(f(c(i)),prec)]; end
    %root found
    if (f(c(i))==0), if (show==true),step=[step, ' c is root!']; disp(step); end, break; end
    %pick new interval using midpoint c
    if (f(a)*f(c(i))<0), b=c(i); step=[step,' b=c'];
    else, a=c(i); step=[step,' a=c']; end
    err(i)=(b-a);
    %display current step if show==true
    if (show==true), disp(step); end
end
end