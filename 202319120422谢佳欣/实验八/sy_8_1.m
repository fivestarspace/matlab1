% 蒲丰投针实验计算圆周率
a = 2; % 平行线间距
b = 1; % 针的长度
n = 100000; % 投针次数

x = unifrnd(0, a/2, 1, n); % 针中点到最近直线的距离，均匀分布在[0, a/2]
theta = unifrnd(0, pi, 1, n); % 针与直线的夹角，均匀分布在[0, π]

% 判断针是否与直线相交，相交条件：x <= (b/2)*sin(theta)
intersect = sum(x <= (b/2)*sin(theta));

% 计算概率和圆周率近似值
p = intersect / n;
pi_approx = (2 * b) / (a * p);

fprintf('投针%d次，相交%d次，概率%f，圆周率近似值%f\n', n, intersect, p, pi_approx);