clear;
clc;

R = 144;
L = 2.65e-3;
tau = L/R;
delta_t = tau/1000;
w = 377;

t_max = (2*pi)/w;
t = [0:delta_t:5*t_max];

v_s = 120*sqrt(2)*cos(w*t);
i_s = [24.23431];

for n=1:1:length(t)-1
   
   i_s(n+1) = (delta_t/L)*(v_s(n)-i_s(n)*R) + i_s(n); 
    
end

v_L = i_s*R;

tiledlayout(2,1);

nexttile;
plot(t,v_L);
title('Voltage over R1');
xlabel('Time (s)');
ylabel('Voltage (v)');
grid;

nexttile;
plot(t,i_s);
title('Source Current');
xlabel('Time (s)');
ylabel('Current (A)');
grid;

figure(2);
plot(t,v_s);
title('Source Voltage');
xlabel('Time (s)');
ylabel('Voltage (v)');
grid;