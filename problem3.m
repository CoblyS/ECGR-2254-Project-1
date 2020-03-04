clear;
clc;

x1 = [0];
x2 = [2];

T = (2*pi)/10;
dt = T/1000;
stop = round((4*3)/dt);
t = [0:1:stop]*dt;

v_in = 5*cos(10*pi*t + 30*(180/pi));

for n = 1:1:stop
    
    x1(n+1) = x2(n)*dt + x1(n);
    x2(n+1) = dt*(v_in(n) - 2*x2(n) - 4*x1(n)) + x2(n);

end

plot(t, x1);
hold on
plot(t,x2);

title('Graph of Solutions');
xlabel('Time (s)');
ylabel('Voltage (v)');
hold off

legend ('V(t)', 'dV(t)/dt');