
function [x,w]=fclencurt(N1,a,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fclencurt.m - Fast Clenshaw Curtis Quadrature
%
% Compute the N nodes and weights for Clenshaw-Curtis
% Quadrature on the interval [a,b]. Unlike Gauss 
% quadratures, Clenshaw-Curtis is only exact for 
% polynomials up to order N, however, using the FFT
% algorithm, the weights and nodes are computed in linear
% time. This script will calculate for N=2^20+1 (1048577
% points) in about 5 seconds on a normal laptop computer.
%
% Written by: Greg von Winckel - 02/12/2005
% Contact: gregvw(at)chtm(dot)unm(dot)edu
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=N1-1; bma=b-a;
c=zeros(N1,2);
c(1:2:N1,1)=(2./[1 1-(2:2:N).^2 ])';
c(2,2)=1;
f=real(ifft([c(1:N1,:);
c(N:-1:2,:)]));
w=bma*([f(1,1);
2*f(2:N,1);
f(N1,1)])/2;
x=0.5*((b+a)+N*bma*f(1:N1,2));



x2=zeros(1,n+1);
x2
x
x2(1:2:end)=x;
x
x2
x2(2:2:end)=a-b*cos((1:2:n)/n*pi);

G=zeros(1,n+1)
G(1:2:end)=F;
G(2:2:end)=feval(f,x2(2:2:end));
G=G(:);