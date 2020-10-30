pkg load control;

clear;

G=tf([7.836e-2 3.918], [8.78e-7 8.02e-4 0.1152 1.82194]);
stepsize=5;

[y_unit t]=step(G,1);
y=y_unit*stepsize;
u=ones(length(t),1)*stepsize;

figure
plot(t,u,'b--',t,y,'r-')
legend('u','y');
xlabel('Time/s');
ylabel('Voltage/V');
