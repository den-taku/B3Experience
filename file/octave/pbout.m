pkg load control;

clear;

G=tf([3.6825e-2 4.91], [2.5125e-8 2.2925e-5 2.8245e-3 1.07e-1 3.91818]);
stepsize=5.5;

[y_unit t]=step(G,1);
y=y_unit*stepsize;
u=ones(length(t),1)*stepsize;

figure
plot(t,u,'b--',t,y,'r-')
legend('u','y');
xlabel('Time/s');
ylabel('Voltage/V');
