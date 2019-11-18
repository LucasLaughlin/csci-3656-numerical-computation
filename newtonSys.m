function [ges,Jinv] = newtonSys(u0,v0,F,f,g,tol,n)
%Given a system of 2 equations, iterate through newtons method and return
%array of value with u on top and v on bottom. Also return inverse jacobian
%-------------------------------------------------------------------------
%u0 = initial guess for u
%u0 = initial guess for v
%F  = 1x2 matrix storing both functions as expressions
%f  = fucntion 1
%g  = function 2
%tol= tolerance
%n  = maximim number of iterations
syms u v;
%calculate inverse of Jacobian of F with respect to vec(
vec=[u,v];
J=jacobian(F,vec);
Jinv = inv(J);
%iterate through step 1
u=u0;
v=v0;
val=[u0;v0]-subs(Jinv)*[f(u0,v0);g(u0,v0)];
uit(1)=double(val(1,1));
vit(1)=double(val(2,1));
err= [abs(uit(1)-u0);abs(vit(1)-v0)];

%while the change in u or v is still above the tolerance and max iterations
%hasn't been reached
i=2;
while (err(1,1)>tol || err(2,1)>tol) && i<=n
    u=uit(i-1);
    v=vit(i-1);
    val=[uit(i-1);vit(i-1)]-subs(Jinv)*[f(uit(i-1),vit(i-1));g(uit(i-1),vit(i-1))];
    uit(i)=double(val(1,1));
    vit(i)=double(val(2,1));
    err= [abs(uit(i)-uit(i-1));abs(vit(i)-vit(i-1))];
    i=i+1;
end
ges=[uit;vit];
end

