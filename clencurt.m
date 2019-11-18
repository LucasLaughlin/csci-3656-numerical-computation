
function [approx]=clencurt(f,n,a,b)
i=(0:n);

cheby=arrayfun(@(x)cos((x*pi)/n),i);

x=((b-a)/2)*cheby +((b+a)/2);

F=arrayfun(f,x)
fft(x)
nvec=(0:n);


coeffs = -1./nvec(2:2:end)./(nvec(2:2:end)-2);
coeffs(1)=0.5;

y=a*coeffs*F';
approx = y;



