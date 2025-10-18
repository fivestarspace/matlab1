function dydt = boat_ode(t, y, v1, v2)
    x = y(1);
    y_val = y(2);
    r = sqrt(x^2 + y_val^2);
    dydt = [v1 - v2 * x / r;
            v2 * y_val / r];
end


d = 100;         
v1 = 1;          
v2 = 2;          
tspan = [0, 100];
y0 = [0, 0];     


[t, y] = ode45(@(t,y) boat_ode(t, y, v1, v2), tspan, y0);


idx = find(y(:,2) >= d, 1);
crossing_time = t(idx);
fprintf('渡河所需时间：%.2f 秒\n', crossing_time);


figure;
plot(y(:,1), y(:,2), 'b-', 'LineWidth', 1.5);
hold on;

xlabel('x 坐标 (m)');
ylabel('y 坐标 (m)');
title('小船航行曲线');
legend('数值解', '解析解');
grid on;


t_target = 20;
[y_target, ~] = interp1(t, y, t_target, 'linear');
fprintf('t=%.2f 秒时，小船位置：(%.2f, %.2f) m\n', t_target, y_target(1), y_target(2));