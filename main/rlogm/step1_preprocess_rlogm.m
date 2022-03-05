%%
% This script calls the gaussianize_DPs_predict for gaussianizing incoming cross-spectrum with the 
% riemlog, which requires the geometric mean calculated with the data used for the norm.

%%
clear

%%
% file of geometric mean: used for gaussianizing cross spectrum with riemlog method
% please download from Synapse https://doi.org/10.7303/syn26712979, 
% it was calculated with data https://doi.org/10.7303/syn26712693, the training will released soon
path_geometricMean='./data/norm/refM_riemlogm_global_1564.mat';            
% metadata table of incoming data: metainfo of the data to be gaussianized
% the table can generate by step0
% here is the example data for Barbados Malnutrition, which also host on Synapse https://doi.org/10.7303/syn26712979,
path_table='./result/BarbadosMalnutrition.xlsx';
% path of folder to save the result
path_out='./result/';


%%
% data filter: exclude bad data, such as lost study information
study=table2cell(readsubtable(path_table,'study'));
%remove data without batch information
study=setdiff(unique(study),...
    {'','U'});        


%% parameter for gaussianize_DPs_predict
% typeLog: type of gaussianize method to apply, 
% now support: 'log' for spectrum, 
%              'logm' for cross-spectrum with euclidean metric
%              'riemlog' for cross-spectrum with riemannian metric
typeLog='riemlogm';
% screen out some data with pair {'variableName','variableValue','variableName','variableValue', ...}
dataFilter={'study',study};
% The tag to be append to the filename of output table to distinguish the project you are running with others. 
% Replace with your own task name
tag=['Barbados1978Malnutrition'];
% load geometric mean
load(path_geometricMean,'refM');


%% 
file_DPs_table=gaussianize_DPs_predict(path_table,path_out,refM,typeLog,[],dataFilter,[],tag);


