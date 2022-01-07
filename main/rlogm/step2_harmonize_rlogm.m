clear;clc;close all;

path_norm='.\data\norm\norm_riemlogm_gfavfa_bava_study.mat';
path_Dps='.\result\DPs_riemlogm_44_Barbados1978Malnutrition.csv';
path_out='.\result\';
batchs={'study'};

mnhs=load(path_norm,'tregs','level','resp','opt');
mnhs.path_csv=path_Dps;
mnhs=mnh_create_predict(mnhs);
mnhs.tag=['zscore'];
mnhs.path_out=path_out;
%%
mnhs=MnhCaller(mnhs);


