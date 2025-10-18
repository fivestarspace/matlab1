year = 1990:1:1996; % 年份
profit = [12, 15, 18, 20, 23, 25, 28]; % 假设的利润数据（单位：万元）


figure;
plot(year, profit, 'o', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
xlabel('年份');
ylabel('利润（万元）');
title('1990-1996年生产利润变化');
grid on;


p = polyfit(year, profit, 1); ）
y_fit = polyval(p, year); 


hold on;
plot(year, y_fit, 'r-', 'LineWidth', 1.5);
legend('实际利润', '线性拟合曲线');


year_pred = [1997, 1998]; 
profit_pred = polyval(p, year_pred); 


fprintf('1997年预测利润：%.2f万元\n', profit_pred(1));
fprintf('1998年预测利润：%.2f万元\n', profit_pred(2));


plot(year_pred, profit_pred, 'gs', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
text(year_pred(1), profit_pred(1), '  1997年预测', 'Color', 'g');
text(year_pred(2), profit_pred(2), '  1998年预测', 'Color', 'g');