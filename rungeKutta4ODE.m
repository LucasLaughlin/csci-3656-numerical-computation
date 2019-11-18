function [ret] = rungeKutta4ODE(f, y0, h, t)
    Y=[];
    Y(1)=y0;
    n=(t(2)-t(1))/h;
    t=linspace(t(1),t(2),n+1);
    tgrid = reshape(t, n+1, 1);
    for i = 1:n
        t_i=tgrid(i);
        s1=f(Y(i),t_i);
        s2=f(Y(i)+(h/2)*s1,t_i+h/2);
        s3=f(Y(i)+(h/2)*s2,t_i+h/2);
        s4=f(Y(i)+s3,t_i+h);
        Y(i+1)=(h/6)*(s1+2*s2+2*s3+s4);
    end
    ret=Y(end);
end
