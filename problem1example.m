delta_t = 1.8e-9;

R = 144;
L = 2.65e-3;
t=[0:delta_t:17e-3];

v_s = 120*sqrt(2)*cos(377*t);
i_s=[24];

for n=1:1:length(t)-1
   
   i_s(n+1) = (delta_t/L)*(v_s(n)-i_s(n)*R) + i_s(n); 
    
end

figure(1);
plot(t,v_s);

tiledlayout(2,1);

nexttile;
plot(t,x);
title('Input');
ylabel('Voltage (v)');
xlabel('Time (s)');

nexttile;
plot(t,y);
title('Output');
ylabel('Voltage (v)');
xlabel('Time (s)');