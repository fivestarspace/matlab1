T = [68, 68, 87, 87, 106, 106, 140, 140]; 
P = [9.7981, 13.324, 9.0078, 13.355, 9.7918, 14.277, 9.6563, 12.463] * 1e3; % 压力，单位：Pa
K = [0.0848, 0.0897, 0.0762, 0.0807, 0.0696, 0.0753, 0.0611, 0.0651]; % 导热系数，单位：W·(m·K)^(-1)
[T_grid, P_grid] = meshgrid(unique(T), unique(P));
K_matrix = reshape(K, 2, 4); 
T_interp = 99; 
P_interp = 10.3e3; 
K_interp = interp2(unique(T), unique(P), K_matrix, T_interp, P_interp, 'spline');
fprintf('当 T = %d°C，P = %.1f×10^3 kPa 时，导热系数 K = %.6f W·(m·K)^(-1)\n',...
    T_interp, P_interp / 1e3, K_interp);