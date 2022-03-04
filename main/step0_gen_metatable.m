

%======================================================
% organized data: 
% 1-collect meta information; 
% 2-extract country, age, sex, EEGmachine, filepath;
% 3-this tabel is teh input of step1
% write by: YingWang(Rigel), MinLi
% date: 2/19/2021
%===================================================


metatable_name='BarbadosMalnutrition';   % metatable name
data_path='.\data\example\BarbadosMalnutrition';  % cross-spectrum tensor path
pathology='Malnutrition';                % pathology of the dataset

T=genMetaDataTable(data_path,pathology);
writetable(T,[data_path,filesep,metatable_name,'.xlsx']);











