%���x�����H(a)v_in�␳
clear;

pkg load control;%control�p�b�P�[�W��ǂݍ���
%JissyuNumbersFile_20201030
load Numbers1.txt;%�萔�t�@�C����ǂݍ���
A=csvread("1023__01in.csv");%A

stepsize=0.5;%�X�e�b�v���͂̑傫��
L=0.010;%�x�ꎞ��
G=tf([K*R_2], [(R_1*T_E*T_M) (R_1*(T_E+T_M)) (R_1+K*R_2)]);%�Ώۂ̓`�B�֐�
G_neo=G*tf([-L/2,1], [L/2,1]);%�x��v�f��1���ߎ��c�炵���D

[y_unit1 t]=step(G,1);%���ԍ���2�̃X�e�b�v����
y1=y_unit1*stepsize*(-1);%�o�͂̕␳

[y_unit2 t]=step(G_neo,1);
y2=y_unit2*stepsize*2;

y=y1.+y2;

u=ones(length(t), 1)*stepsize;%���͂̕␳

figure
plot(t, u, 'b--', t, y, 'r-', A(:,1), A(:,2), 'b-', A(:,1), A(:,3), 'g-')%���ʂ̃v���b�g
legend('u', 'y', 'vref', 'vout');%�}��
xlabel('Time/s');%x���̃��x��
ylabel('Voltage/V');%y���̃��x��