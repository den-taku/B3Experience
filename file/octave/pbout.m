pkg load control;

clear;

A=csvread("10207out.csv");

R1=470e3;
R2=100e3;
R3=2e3;
R4=7.5e3;
C1=10e-6;
C2=1e-6;
K=1.03;
TE=1.3267e-3;
TM=0.0909;
ke=0.0286479;
kp=4.77;

C=tf([C1*R3*R2*R4 R2*R4], [C2*R4*R1*R3 R1*R3]);
P=tf([kp*K/ke], [TE*TM TE+TM 1 0]);

G=C/(1+C*P);
%G=tf([TE*TM*C1*R2*R3*R4 R2*R4*(TE*TM+(TE+TM)*C1*R3) R2*R4*(TE+TM+C1*R3) R2*R4 0], [TE*TM*C2*R1*R3*R4 R1*R3*(TE*TM+(TE+TM)*C2*R4) R1*R3*(TE+TM+C2*R4) R3*(R1+K*C1*R2*R4) K*R2*R4]);
stepsize=5.5;

[y_unit t]=step(G,0.5);
y=y_unit*stepsize;
u=ones(length(t),1)*stepsize;

figure
plot(t,u,'b--',t,y,'r-', A(:,1), A(:,2), 'b-', A(:,1), A(:,3), 'g-')
legend('u','y', 'g');
xlabel('Time/s');
ylabel('Voltage/V');
