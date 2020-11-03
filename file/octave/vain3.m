pkg load control;

clear;

R1=20e3;
R2=300e3;
K=1.03;
TE=1.3267e-3;
TM=0.0909;

A=csvread("1023__01in.csv");

L=0.010;
stepsize=0.5;

G=tf([K*R2], [R1*TE*TM R1*(TE+TM) R1+K*R2]);
G_neo=G*tf([-L/2,1], [L/2,1]);


[y_unit1 t]=step(G,0.05);
y1=y_unit1*stepsize*(-1);

[y_unit2 t]=step(G_neo,0.05);
y2=y_unit2*stepsize*2;

y=y1+y2;

u=ones(length(t),1)*stepsize;

figure
plot(t,u,'b--',t,y,'r-', A(:,1), A(:,2), 'b-', A(:,1), A(:,3), 'g-')
legend('u','y', 'v_ref', 'v_out');
xlabel('Time/s');
ylabel('Voltage/V');
