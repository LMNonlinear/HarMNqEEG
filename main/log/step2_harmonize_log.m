clear;clc;close all;

path_norm='.\data\norm\norm_log_gfavfa_bfvf_study.mat';
path_Dps='.\result\DPs_log_44_Barbados1978Malnutrition.csv';
path_out='.\result\';
batchs={'study'};

mnhs=load(path_norm,'tregs','level','resp','opt');

mnhs.batch={'study'};
mnhs.path_table=path_Dps;
mnhs.path_out=path_out;
mnhs.reRefBatch={'Brb2_DEDAAS_Malnutrition','DEDAAS Barbados1978'};   % study name and batch refrence name
mnhs.tag=['zscore'];

mnhs=mnh_create_predict(mnhs);


%%
mnhs=MnhCaller(mnhs);


