clc,clear;
format long;
set_function=input('Set function：f = ','s');
f = inline(set_function);
a = 0;%积分下界
b = 2;%积分上界
epsilon = 1e-6;
h = b-a;
T = zeros(252,252);%大矩阵，用于储存T
T(1,1) = (h/2)*(f(a)+f(b));%计算T(1,1)
%杨玉林哥哥好帅鸭，受不鸟辣-----By林嘉政
T(0 +1,0 +1) = (h/2) * (f(a) + f(b));%计算T(0,0)

for k = 1:252
    Sum = 0;
    deltaX = (b - a) / 2^(k - 1);
    delta = deltaX / 2;
    for i = 0:(2^(k-1)-1)
        Sum = Sum + f(a + i * deltaX + delta);
    end
    T(k +1, 0 +1) = 0.5 * T(k-1 +1, 0 +1) + h/2 * Sum; 
    %求加速值
    for m = 1 : k
        T(k +1, m +1) = (4^m / (4^m -1)) * T(k +1, m-1 +1) - (1/(4^m - 1)) * T(k-1 +1, m-1 +1);
    end
    %判断是否到达精度
    if abs(T( k+1 , m+1 )-T( k-1 +1, m-1 +1)) <= epsilon
       result = T(k+1,m+1);
       delta_x = T( k+1 , m+1 )-T( k-1 +1, m-1 +1);
       %将精度转化为绝对值
       if delta_x >= 0
           delta_x = delta_x;
       else
           delta_x = -1 * delta_x;
       delta_x;
       end
       break;
    end
    h = h / 2;
end

disp('The result is given in a chart')
