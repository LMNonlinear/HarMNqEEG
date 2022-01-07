clear;clc;close all;

path_norm='.\data\norm\norm_log_gfavfa_bfvf_study.mat';
path_Dps='.\result\DPs_log_44_Barbados1978Malnutrition.csv';
path_out='.\result\';
batchs={'study'};

mnhs=load(path_norm,'tregs','level','resp','opt');
mnhs.path_csv=path_Dps;
mnhs=mnh_create_predict(mnhs);
mnhs.tag=['zscore'];
mnhs.path_out=path_out;
%%
mnhs=MnhCaller(mnhs);


