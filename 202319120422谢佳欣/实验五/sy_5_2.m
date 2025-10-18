d = 100;          
v2 = 2;           % 船在静水中的速度 (单位: m/s)
k = 1;            % 水流速度与船速的比例系数
v1 = k * v2;      % 水流速度 (单位: m/s)。题目中 v1 = k m/s，这里按比例计算


y0 = [0, 0];


tspan = [0, 200]; 


options = odeset('Events', @(t,y) events_function(t,y,d));
[t, y, te, ye] = ode45(@(t,y) boat_ode(t, y, v1, v2), tspan, y0, options);



if ~isempty(te)
    crossing_time = te(1);
    landing_point_x = ye(1, 1);
    landing_point_y = ye(1, 2);

    fprintf('--- 渡河结果 ---\n');
    fprintf('渡河所需时间: %.2f 秒\n', crossing_time);
    fprintf('登陆点坐标: (%.2f, %.2f) 米\n', landing_point_x, landing_point_y);
    fprintf('由于水流影响，小船在下游 %.2f 米处登陆。\n', landing_point_x);
else
    fprintf('在设定的时间范围内 (%.2f 秒)，小船未到达对岸。\n', tspan(end));
    crossing_time = NaN;
    landing_point_x = NaN;
end

% --- 4. 绘图：航行轨迹 ---
figure;
plot(y(:,1), y(:,2), 'b-', 'LineWidth', 2);
hold on;

plot([min(y(:,1))-10, max(y(:,1))+10], [0, 0], 'k-', 'LineWidth', 1.5);
plot([min(y(:,1))-10, max(y(:,1))+10], [d, d], 'k-', 'LineWidth', 1.5);

plot(0, 0, 'go', 'MarkerSize', 8, 'LineWidth', 2);
text(0, -5, '起点 A(0,0)');

if ~isnan(landing_point_x)
    plot(landing_point_x, d, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
    text(landing_point_x, d+2, sprintf('登陆点 (%.1f, %d)', landing_point_x, d));
end

xlabel('X 坐标 (米)');
ylabel('Y 坐标 (米)');
title(sprintf('小船航行轨迹 (v_1 = %.1f m/s, v_2 = %.1f m/s)', v1, v2));
legend('航行轨迹', '河岸', 'Location', 'northwest');
grid on;
axis equal; % 使 x 和 y 方向的单位长度相同，图形更真实
hold off;


t_target = 20;
if t_target <= t(end)
    
    pos_target = interp1(t, y, t_target, 'linear');
    fprintf('\n在 t = %.2f 秒时，小船的位置为: (%.2f, %.2f) 米\n', ...
        t_target, pos_target(1), pos_target(2));
else
    fprintf('\n目标时间 t = %.2f 秒 超过了计算的时间范围。\n', t_target);
end



function [value,isterminal,direction] = events_function(t,y,d)
    
    value = y(2) - d;
    
  
    isterminal = 1;
    
    
    direction = 1;
end