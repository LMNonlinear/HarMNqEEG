
%%
clear
path_csv='./data/example/DataInfo_Barbados1978Malnutrition_44.csv';
%% data filter: exclude bad data, such as some problem study
study=table2cell(readsubtable(path_csv,'study'));
study=setdiff(unique(study),...
    {'','U'});%remove empty info data
%%
typeLog='log';
dataFilter={'study',study};
tag=['Barbados1978Malnutrition'];%Replace with your task name
path_out='./result/';
file_DPs_table=gen_DPs_extension(path_csv,path_out,[],typeLog,[],dataFilter,[],tag);


