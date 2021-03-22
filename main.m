[ACC_X, ACC_Y, ACC_Z] = openFile("InputFiles/acc_exp01_user01.txt");
tiledlayout(3,1)

nexttile
displayGraph(ACC_X)

nexttile
displayGraph(ACC_Y)

nexttile
displayGraph(ACC_Z)