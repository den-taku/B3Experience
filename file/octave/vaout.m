pkg load control;

clear;

G=tf([1.755e-3 1.3695 15], [1.17e-4 9.13e-2 16.45]);
stepsize=0.5;

[y_unit t]=step(G,1);
y=y_unit*stepsize;
u=ones(length(t),1)*stepsize;

figure
plot(t,u,'b--',t,y,'r-')
legend('u','y');
xlabel('Time/s');
ylabel('Voltage/V');
