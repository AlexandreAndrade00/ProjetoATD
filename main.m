[ACC_X, ACC_Y, ACC_Z] = openFile("InputFiles/acc_exp03_user02.txt");
figure(1)

subplot(311)
displayGraph(ACC_X)
ylabel("ACC_X")

subplot(312)
displayGraph(ACC_Y)
ylabel("ACC_Y")

subplot(313)
displayGraph(ACC_Z)
ylabel("ACC_Z")

fs=50;

%DFT
%DFT(ACC_X,ACC_Y,ACC_Z,fs,420,1300)%1
%DFT(ACC_X,ACC_Y,ACC_Z,fs,1360,1700)%2
%DFT(ACC_X,ACC_Y,ACC_Z,fs,1730,2620)%3
%DFT(ACC_X,ACC_Y,ACC_Z,fs,2620,2800)%4
%DFT(ACC_X,ACC_Y,ACC_Z,fs,2800,3800)%5
%DFT(ACC_X,ACC_Y,ACC_Z,fs,3800,4360)%6
%DFT(ACC_X,ACC_Y,ACC_Z,fs,4410,5100)%7
%DFT(ACC_X,ACC_Y,ACC_Z,fs,5100,5400)%8
%DFT(ACC_X,ACC_Y,ACC_Z,fs,5520,6170)%9
%DFT(ACC_X,ACC_Y,ACC_Z,fs,6185,6440)%10
%DFT(ACC_X,ACC_Y,ACC_Z,fs,6450,7320)%11
%DFT(ACC_X,ACC_Y,ACC_Z,fs,7350,7440)%12
DFT(ACC_X,ACC_Y,ACC_Z,fs,7480,8300)%13
DFT(ACC_X,ACC_Y,ACC_Z,fs,8400,9600)%14
DFT(ACC_X,ACC_Y,ACC_Z,fs,9840,11000)%15
%DFT(ACC_X,ACC_Y,ACC_Z,fs,11130,12472)%16
%DFT(ACC_X,ACC_Y,ACC_Z,fs,11670,12403)%17
%DFT(ACC_X,ACC_Y,ACC_Z,fs,12600,13360)%18
%DFT(ACC_X,ACC_Y,ACC_Z,fs,13600,14285)%19
%DFT(ACC_X,ACC_Y,ACC_Z,fs,14500,15240)%20
%DFT(ACC_X,ACC_Y,ACC_Z,fs,15430,16050)%21
%DFT(ACC_X,ACC_Y,ACC_Z,fs,16150,16900)%22