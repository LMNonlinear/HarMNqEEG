%% 
% This script shows the example of extracting and ploting the data table harmonized by step2


clear

%%
resp_study_z='zstudyriemlogm10_10';   % the cz-score name which consituting with zstudyriemlogm + index of the corss-spectrum element (lower triangle like 3_2 )
resp_global_z='zglobalriemlogm10_10';  % the z-score name which consituting with zglobalriemlogm + index of the corss-spectrum element (lower triangle like 3_2 )
% user can add more variable name in the cell to load
vars={'freq';'ageRaw';resp_global_z;resp_study_z};   %% variables for scatter plots
T=readsubtable('./result/DPs_riemlogm_44_Barbados1978Malnutrition_zscore.csv',vars);  % input; table comes from the 


%%
x(:,1)=T.freq;
x(:,2)=T.ageRaw;

y(:,1)=T.(resp_global_z);
y(:,2)=T.(resp_study_z);

figure(101)
clf
hold on;
scatter3(x(:,1),x(:,2),y(:,1),'or')
scatter3(x(:,1),x(:,2),y(:,2),100,'.b')
view(66,30);