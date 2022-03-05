%%
% This script calls the gaussianize_DPs_predict for gaussianize incoming spectrum with the 
% log.

%%
clear

%% 
% metadata table of incoming data: metainfo of the data to be gaussianized
% the table can generate by step0
% here is the example data for Barbados Malnutrition, which also host on Synapse https://doi.org/10.7303/syn26712979,
path_table='./data/example/BarbadosMalnutrition/BarbadosMalnutrition.xlsx';




%% data filter: exclude bad data, such as some problem study
study=table2cell(readsubtable(path_table,'study'));
%remove data without batch information
study=setdiff(unique(study),...
    {'','U'});%remove empty info data

%%
%% parameter for gaussianize_DPs_predict
% typeLog: type of gaussianize method to apply, 
% now support: 'log' for spectrum, 
%              'logm' for cross-spectrum with euclidean metric
%              'riemlog' for cross-spectrum with riemannian metric
typeLog='log';


% screen out some data with pair {'variableName','variableValue','variableName','variableValue', ...}
dataFilter={'study',study};
% The tag to be append to the filename of output table to distinguish the project you are running with others. 
% Replace with your own task name
tag=['Barbados1978Malnutrition'];
path_out='./result/';


%%
file_DPs_table=gaussianize_DPs_predict(path_table,path_out,[],typeLog,[],dataFilter,[],tag);


