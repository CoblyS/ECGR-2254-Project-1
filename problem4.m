clear;
clc;

K = 0.029;
J = 2e-4;
beta = 0.5e-5;
L = 0.01;
R = 3.38;

x1 = 1.5;
x2 = 0;

dt = .2/1000;
stop = round(3/dt);
t = [0:1:stop]*dt;

v_in = (0.002*t + 0.00005)/0.0002;

for a = 1:1:stop
    
    x1(a+1) = dt*x2(a) + x1(a);
    x2(a+1) = dt*(v_in(a) - 338*x2(a) - 421*x1(a)) + x2(a);
    
end

omega = [10];

for b = 1:1:stop
    
    omega(b+1) = dt*((K*x1(b)) - (beta*omega(b)))/J + omega(b);
    
end

theta = [0];

for c = 1:1:stop
    
    theta(c+1) = dt*omega(c) + theta(c);
    
end

tiledlayout(3,1)

nexttile;
plot(t,x1);
title('Current (A)');
xlabel('Time (s)');

nexttile;
plot(t,omega);
title('Angular Speed (rad/sec)');
xlabel('Time (s)');

nexttile;
plot(t,theta);
title('Angle (rad)');
xlabel('Time (s)');
