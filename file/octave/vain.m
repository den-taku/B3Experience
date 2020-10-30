pkg load control;

clear;

R1=20e3;
R2=300e3;
K=1.03;
TE=1.3267e-3;
TM=0.0909;

G=tf([K*R2], [R1*TE*TM R1*(TE+TM) R1+K*R2]);
stepsize=0.5;

[y_unit t]=step(G,1);
y=y_unit*stepsize;
u=ones(length(t),1)*stepsize;

figure
plot(t,u,'b--',t,y,'r-')
legend('u','y');
xlabel('Time/s');
ylabel('Voltage/V');
