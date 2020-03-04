clear;
clc;

Rs = 0.262;
X1 = 1.206;
Xm = 54.02;
X2 = 1.206;
R2 = 0.187;
w = 2*pi*60;

J = 63.87;
beta = 0.2565;

dt = 0.001;
tmax = 10;
t = [0:dt:tmax];

Vas = 2300;
omega = [0];
omega_max = 2*pi*30;

for n = 1:1:length(t)-1
    
    slip = (omega_max - omega(n))/omega_max;
    
    A = [(-j*Xm),((R2/slip)+j*X2+j*Xm),0;(Rs+j*X1+j*Xm),(-j*Xm),Vas];
    C = rref(A);
    
    i_1(n+1) = abs(C(1,3));
    i_2(n+1) = abs(C(2,3));
    
    Tm = (3*((i_2(n))^2)*(R2/slip))/(omega_max);
    omega(n+1) = (dt*(Tm - (beta*(omega(n)^2))))/J + omega(n);
    
end

figure;
tiledlayout(2,1);

nexttile;
plot(t,omega);
title('Motor Speed ');
xlabel('Time (s)');

nexttile;
plot(t,i_1);
title('Current I_1');
xlabel('Time (s)');

