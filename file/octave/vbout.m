pkg load control;

clear;

R1=470e3;
R2=100e3;
R3=2e3;
R4=7.5e3;
K=1.03;
TE=1.3267e-3;
TM=0.0909;


G=tf([5.025e-5 3.915e-2 4.29e-1 0], [8.78e-7 8.02e-4 0.1152 1.82194]);
stepsize=5;

[y_unit t]=step(G,1);
y=y_unit*stepsize;
u=ones(length(t),1)*stepsize;

figure
plot(t,u,'b--',t,y,'r-')
legend('u','y');
xlabel('Time/s');
ylabel('Voltage/V');
