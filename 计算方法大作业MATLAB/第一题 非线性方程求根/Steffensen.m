%steffensen迭代法
clc;
clear;
syms x;
f(x)=input('Set f(x) by x ：f(x)=');
g(x)=input('Set x_2 ：x=');
x1=input('Set initial value : x0=');
eps=input('Set precision : eps=');
k=1;
y1=g(x1);
z1=g(y1);
x=[x1];
y=[y1];
z=[z1];
k=k+1;
x2=x1-(y1-x1)^2/(z1-2*y1+x1);
y2=g(x2);
z2=g(y2);
x=[x x2];
y=[y y2];
z=[z z2];
T=[1,x1,y1,z1,f(x1);2,x2,y2,z2,f(x2)];
while abs(x(k)-x(k-1))>eps/2
    if (abs(f(x(k)))>1e15)||(k>500)
        error('Error!!!')
    else
        k=k+1;
        xk=vpa(x(k-1)-(y(k-1)-x(k-1))^2/(z(k-1)-2*y(k-1)+x(k-1)),30);
        x=[x xk]; %
        yk=g(x(k));
        y=[y yk];
        zk=g(yk);
        z=[z zk];
        T=[T;k,xk,yk,zk,f(xk)];
    end
end
fprintf('  k             xk           yk           zk                   f(xk)\n');
disp(vpa(T,10));
fprintf('By caculating %d times, the result is ：x=%.8f\n',k-1,T(k,2))
