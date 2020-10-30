pkg load control;

clear;

R1=20e3;
R2=300e3;
K=1.03;
TE=1.3267e-3;
TM=0.0909;

A=csvread("102308in.csv");


G=tf([K*R2], [R1*TE*TM R1*(TE+TM) R1+K*R2]);
stepsize=0.5;

[y_unit1 t1]=step(G,0.3-0.01); % ステップ信号を入れた時の反応を0.5秒間分入れる
[y_unit2 t2]=step(G,0.3); 

y1=y_unit1*stepsize*2;
y2=y_unit2*stepsize*(-1);
y=ones(length(t1)+length(t2),1);
t=0:(0.3/(length(t1)+length(t2)-1)):0.3;

tmp=0:(0.3/0.01):0.005;

for x = 1:length(tmp) %y2の値を先に入れる
    y(x,1) = y2(x,1);
endfor

for x = 1:length(t1) %y1の値をそのあとに入れる
  y(length(tmp)+x,1) = y1(x,1) + y2(x+length(tmp),1);
endfor
u=ones(length(t),1)*stepsize;

for x = length(A(:,1))
  A(x,1) = A(x,1) + 0.005 + 0.005 + 0.0005 + 0.0005;
endfor

figure
plot(t,u,'b--',t,y,'r-', A(:,1), A(:,2), 'b-', A(:,1), A(:,3), 'g-')
legend('u','y');
xlabel('Time/s');
ylabel('Voltage/V');

%figure
%plot(t1,y1,'r-',t2,y2,'g-');
