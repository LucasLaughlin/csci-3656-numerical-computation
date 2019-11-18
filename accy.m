function [acc] = accy(ges, prec)

bg=num2str(ges(end), prec);
max=length(ges);
i=1;

while (i<=max)
    cnt=0;
    j=1;
    str = num2str(ges(i), prec);
    cont=true;
    while((cont==true) && j<numel(bg) && j<numel(str))
        if(bg(j)=='.'), j=j+1;continue; end
        if (str(j)==bg(j))
            cnt=cnt+1;
            j=j+1;
        else
            cont=false; end
    end
    acc(i)=cnt;
    i=i+1;
end

