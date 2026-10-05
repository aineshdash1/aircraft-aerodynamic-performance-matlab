clc;
clear;
close all;

%% Aircraft Parameters

rho = 1.225;       % Air density (kg/m^3)
S = 16.2;          % Wing area (m^2)
g = 9.81;          % Gravitational acceleration (m/s^2)

m = 1000;          % Aircraft mass (kg)
W = m*g;           % Aircraft weight (N)

CD0 = 0.02;        % Zero-lift drag coefficient
k = 0.05;          % Induced drag factor

CL_fixed = 0.5;    % Fixed lift coefficient
CD_fixed = 0.03;   % Fixed drag coefficient

V = 10:1:100;      % Velocity range (m/s)


%% 1. Lift and Drag for Fixed CL and CD

L = 0.5*rho*S*CL_fixed.*V.^2;

D = 0.5*rho*S*CD_fixed.*V.^2;

LD = L./D;


figure;

plot(V,L,'LineWidth',2);
hold on;
plot(V,D,'LineWidth',2);

xlabel('Velocity (m/s)');
ylabel('Force (N)');
title('Lift and Drag vs Velocity');

legend('Lift','Drag');
grid on;
hold off;


%% 2. Lift-to-Drag Ratio

figure;

plot(V,LD,'LineWidth',2);

xlabel('Velocity (m/s)');
ylabel('Lift-to-Drag Ratio (L/D)');
title('Lift-to-Drag Ratio vs Velocity');

grid on;


%% 3. Steady-Level Flight

% In steady level flight:
% Lift = Weight

CL_level = (2*W)./(rho.*V.^2*S);

% Calculate lift again using the calculated CL
L_level = 0.5*rho.*V.^2*S.*CL_level;

% Since L = W in steady level flight
% L_level should be approximately equal to W


%% 4. Calculate Drag Coefficient

CD_level = CD0 + k.*CL_level.^2;


figure;

plot(V,CL_level,'LineWidth',2);

xlabel('Velocity (m/s)');
ylabel('Lift Coefficient (C_L)');
title('Lift Coefficient vs Velocity');

grid on;


figure;

plot(V,CD_level,'LineWidth',2);

xlabel('Velocity (m/s)');
ylabel('Drag Coefficient (C_D)');
title('Drag Coefficient vs Velocity');

grid on;


%% 5. Calculate Drag in Steady-Level Flight

D_level = 0.5*rho.*V.^2*S.*CD_level;

LD_level = L_level./D_level;


figure;

plot(V,D_level,'LineWidth',2);

xlabel('Velocity (m/s)');
ylabel('Drag (N)');
title('Drag vs Velocity in Steady-Level Flight');

grid on;


%% 6. Lift-to-Drag Ratio in Steady-Level Flight

figure;

plot(V,LD_level,'LineWidth',2);

xlabel('Velocity (m/s)');
ylabel('Lift-to-Drag Ratio (L/D)');
title('Aerodynamic Efficiency vs Velocity');

grid on;


%% 7. Drag Polar

CL_range = 0:0.01:1.5;

CD_range = CD0 + k.*CL_range.^2;

figure;

plot(CL_range,CD_range,'LineWidth',2);

xlabel('Lift Coefficient (C_L)');
ylabel('Drag Coefficient (C_D)');
title('Aircraft Drag Polar');

grid on;


%% 8. L/D vs CL

LD_polar = CL_range./CD_range;

figure;

plot(CL_range,LD_polar,'LineWidth',2);

xlabel('Lift Coefficient (C_L)');
ylabel('Lift-to-Drag Ratio (L/D)');
title('L/D vs Lift Coefficient');

grid on;


%% 9. Maximum L/D

CL_opt = sqrt(CD0/k);

LD_max = 1/(2*sqrt(CD0*k));

fprintf('Maximum L/D = %.2f\n',LD_max);
fprintf('Optimum CL = %.2f\n',CL_opt);


%% 10. Compare Different Aircraft Weights

masses = [800 1000 1200];

weights = masses*g;

V_level = sqrt((2.*weights)./(rho*S*CL_fixed));

fprintf('\nLevel Flight Speeds for CL = %.2f:\n',CL_fixed);

for i = 1:length(masses)
    fprintf('%d kg: %.2f m/s\n',masses(i),V_level(i));
end


%% 11. Stall Speed

CL_max = 1.5;

V_stall = sqrt((2.*weights)./(rho*S*CL_max));

fprintf('\nStall Speeds:\n');

for i = 1:length(masses)
    fprintf('%d kg: %.2f m/s\n',masses(i),V_stall(i));
end


%% 12. Plot Stall Speed vs Mass

figure;

plot(masses,V_stall,'o-','LineWidth',2);

xlabel('Aircraft Mass (kg)');
ylabel('Stall Speed (m/s)');
title('Stall Speed vs Aircraft Mass');

grid on;