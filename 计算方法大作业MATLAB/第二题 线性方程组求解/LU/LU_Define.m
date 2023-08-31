A=zeros(20);%生成一个20*20的零矩阵
for i1=1:20
    A( i1 , i1 )=3.0;
end
for i2=2:20
    A( i2 , i2 - 1 )=-0.5;
    A( i2 - 1 , i2 )=-0.5;
end
for i3=3:20
    A( i3 , i3 - 2 )=-0.25;
    A( i3 - 2 , i3 )=-0.25;
end

b=zeros(20,1);%生成一个20*1的一维矩阵
for r1=2:18
    b( r1 , 1 )=3.0;
end
b(1,1)=4.5 ; b(20,1)=4.5;
b(2,1)=3.5 ; b(19,1)=3.5;

test_matrix = inv(A)*b;
format short;