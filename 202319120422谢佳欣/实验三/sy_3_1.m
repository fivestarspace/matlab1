% 实验内容 1：分析氮肥施肥量与土豆产量的关系

% 输入数据
x = [0, 34, 67, 101, 135, 202, 259, 336, 404, 471]; % 施肥量 (kg/hm)
y = [15.18, 21.36, 25.72, 32.29, 34.03, 39.45, 43.15, 43.46, 40.83, 30.75]; % 产量 (t/ha)


figure;
plot(x, y, 'o', 'MarkerSize', 6);
xlabel('施肥量 (kg/hm)');
ylabel('产量 (t/ha)');
title('氮肥施肥量与土豆产量的散点图');
grid on;

）
p = polyfit(x, y, 2); 
y_fit = polyval(p, x); 

% 绘制拟合曲线
hold on;
plot(x, y_fit, 'r-', 'LineWidth', 1.5);
legend('原始数据', '二次多项式拟合');