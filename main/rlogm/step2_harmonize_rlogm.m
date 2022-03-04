clear;clc;close all;

path_norm='.\data\norm\norm_riemlogm_gfavfa_bava_study.mat';
path_Dps='.\result\DPs_riemlogm_44_Barbados1978Malnutrition.csv';
path_out='.\result\';




mnhs=load(path_norm,'tregs','level','resp','opt');


mnhs.batch={'study'};
mnhs.path_csv=path_Dps;
mnhs.path_out=path_out;
mnhs.reRefBatch={'DEDAAS Barbados1978','BrainAmpDC Chengdu'};
mnhs.tag=['zscore'];

mnhs=mnh_create_predict(mnhs);



%%
mnhs=MnhCaller(mnhs);


