
clear
resp_global_z='zstudyriemlogm10_10';
resp_batch_z='zglobalriemlogm10_10';
vars={'freq';'ageRaw';resp_global_z;resp_batch_z};
T=readsubtable('./result/DPs_riemlogm_44_Barbados1978Malnutrition_zscore.csv',vars);

x(:,1)=T.freq;
x(:,2)=T.ageRaw;

y(:,1)=T.(resp_global_z);
y(:,2)=T.(resp_batch_z);

figure(101)
clf
hold on;
scatter3(x(:,1),x(:,2),y(:,1),'or')
scatter3(x(:,1),x(:,2),y(:,2),100,'.b')
view(66,30);