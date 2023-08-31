%不动点迭代法
clc;
clear;
syms x;
f(x)=input('Set f(x) by x ：f(x)=');
g(x)=input('Set x_2 ：x='); 
x0=input('Set initial value : x0=');
eps=input('Set precision : eps=');
k=0;
T=[0,x0,f(x0)];
k=k+1;%k=1,第k次迭代
xk=g(x0);
T=[T;k,xk,f(xk)];
while (abs(g(xk)-xk)>eps/2)||(abs(f(xk))>1)
    if (k>1000)||(abs(f(xk))>1e15)
        error('Error!!!')
    else
        k=k+1;%迭代次数加一
        xk=vpa(g(xk),30);
        T=[T;k,xk,f(xk)];
    end
end
T=[T;k+1,g(xk),f(g(xk))];
fprintf('   k            xk              f(xk)\n');
disp(vpa(T,10));
fprintf('By caculating %d times, the result is ：x=%.8f\n',k+1,T(k+2,2))
fprintf('f(x(%d))=%.8f\n',k+1,T(k+2,3))
