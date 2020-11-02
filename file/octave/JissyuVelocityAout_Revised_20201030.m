%速度制御回路(a)v_in補正
clear;

pkg load control;%controlパッケージを読み込む
%JissyuNumbersFile_20201030
load Numbers1.txt;%定数ファイルを読み込む
A=csvread("1023__01in.csv");%A

stepsize=0.5;%ステップ入力の大きさ
L=0.010;%遅れ時間
G=tf([K*R_2], [(R_1*T_E*T_M) (R_1*(T_E+T_M)) (R_1+K*R_2)]);%対象の伝達関数
G_neo=G*tf([-L/2,1], [L/2,1]);%遅れ要素の1次近似…らしい．

[y_unit1 t]=step(G,1);%時間差で2つのステップ入力
y1=y_unit1*stepsize*(-1);%出力の補正

[y_unit2 t]=step(G_neo,1);
y2=y_unit2*stepsize*2;

y=y1.+y2;

u=ones(length(t), 1)*stepsize;%入力の補正

figure
plot(t, u, 'b--', t, y, 'r-', A(:,1), A(:,2), 'b-', A(:,1), A(:,3), 'g-')%結果のプロット
legend('u', 'y', 'vref', 'vout');%凡例
xlabel('Time/s');%x軸のラベル
ylabel('Voltage/V');%y軸のラベル