clear;
clc;

[y,Fs]=audioread('problem2.wav'); 
x=y*3;

R = 1;
C = 318.3e-6;
dt = 1/Fs;
t=dt:dt:length(x)*dt;
t=transpose(t);

for n=1:1:length(x)-1
    
    y(n+1)=y(n)-x(n)+x(n+1)-(dt/(R*C))*y(n);
    
end

v_max = max(y);

subplot(2,1,1);
plot(t,x);
title('Input');
ylabel('Voltage (v)');
xlabel('Time (s)');

subplot(2,1,2);
plot(t,y);
title('Output');
ylabel('Voltage (v)');
xlabel('Time (s)');

sound(y,Fs);