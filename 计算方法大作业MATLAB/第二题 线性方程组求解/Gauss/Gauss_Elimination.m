Gauss_Define;
x1=Gauss_elimination(A1,b1);

function x=Gauss_elimination(A,b)%高斯消去法的函数
[rows,~]=size(A);
aug_matix=[A,b];%增广矩阵
for i=1:rows
    if aug_matix(i,i)~=0
        k=aug_matix(:,i);
        aug_matix(i,:)=aug_matix(i,:)./aug_matix(i,i);
        k=-k;
        k(i)=0;
        aug_matix=k*aug_matix(i,:)+aug_matix;
    else
        aug_matix(:,rows+1:end)=nan;
        break
    end
end
x=aug_matix(:,rows+1:end);
end
