LU_Define
A
b
n=length(b);
k=2;
U(1,1:n)=A(1,1:n);
L(2:n,1)=A(2:n,1)/U(1,1);
for k=2:n
    U(k,k:n)=A(k,k:n)-L(k,1:k-1)*U(1:k-1,k:n);
    L(k+1:n,k)=(A(k+1:n,k)-L(k+1:n,1:k-1)*U(1:k-1,k))/U(k,k);
end
for i=1:20
L(i,i)=1;
end
L;
U;
%用向前消去法解下三角方程组Ly=b
y=zeros(n,1);
y(1)=b(1);
for k=2:n
    y(k)=b(k)-L(k,1:k-1)*y(1:k-1);
end
y;
%用回代法解上上角方程组Ux=y
x=zeros(n,1);
x(n)=y(n)/U(n,n);
for k=n-1:-1:1
    x(k)=(y(k)-U(k,k+1:n)*x(k+1:n))/U(k,k);
end
x;
