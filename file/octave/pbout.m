pkg load control;

clear;

R1=470e3;
R2=100e3;
R3=2e3;
R4=7.5e3;
K=1.03;
TE=1.3267e-3;
TM=0.0909;
ke=0.0286479;
kp=4.77;


G=tf([5.34e-8 4.43e-5 2.53e-3 2.28e-2 0], [2.5125e-8 2.2925e-5 2.8245e-3 1.07e-1 3.91818]);
stepsize=5.5;

[y_unit t]=step(G,1);
y=y_unit*stepsize;
u=ones(length(t),1)*stepsize;

figure
plot(t,u,'b--',t,y,'r-')
legend('u','y');
xlabel('Time/s');
ylabel('Voltage/V');
