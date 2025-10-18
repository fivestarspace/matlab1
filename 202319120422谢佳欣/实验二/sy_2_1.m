x = [0.1, 0.8, 1.3, 1.9, 2.5, 3.1];
y = [1.2, 1.6, 2.7, 2.0, 1.3, 0.5];
x_interp = 2.0;
% 线性插值
y_linear = interp1(x, y, x_interp, 'linear');
disp(['线性插值在x=2.0处的值为：', num2str(y_linear)]);