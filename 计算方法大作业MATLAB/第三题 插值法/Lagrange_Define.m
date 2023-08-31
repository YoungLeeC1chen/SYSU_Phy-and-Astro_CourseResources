x=[0.2 0.4 0.6 0.8 1.0];
fx=[0.9798652 0.9177710 0.808038 0.6386093 0.3843735];
x0=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];

y0 = Lagrange(x,fx,x0);


function y0=Lagrange(x,fx,x0)
m=length(x);
n=length(fx);
if m~=n
    error('向量x,y长度必须一致');
end
s=0;
for i=1:n
    t=ones(1,length(x0));
    for j=1:n
        if j~=i
            t=t.*(x0-x(j))/(x(i)-x(j));
        end
    end
    s=s+t*fx(i);
end
y0=s;
end