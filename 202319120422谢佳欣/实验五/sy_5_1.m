x = [2, 3, 4, 5, 6];
y = [2.2, 3.8, 5.5, 6.5, 7.0];


p = polyfit(x, y, 1);  


fprintf('线性回归方程为: y = %.4f x + %.4f\n', p(1), p(2));  


y_pred = polyval(p, 10);  
fprintf('第10年所支出的维修费用预测值为: %.4f 万元\n', y_pred);