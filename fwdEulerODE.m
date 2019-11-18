function [ret] = fwdEulerODE(f, y0, h, t)
    Y=[];
    Y(1)=y0;
    n=(t(2)-t(1))/h;
    
   for i=1:n-1
        Y(i+1)=Y(i)+h*f(Y(i),(i)*h);
    end
    ret=Y(end);
end