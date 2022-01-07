function mnhs=MnhCaller(mnhs)
 %%
 %     Author: Ying Wang, Min Li
 %     Create Time: 2021
 %     Copyright(c): 2020-2022 Ying Wang, yingwangrigel@gmail.com, Min Li, minli.231314@gmail.com
 %     Joint China-Cuba LAB, UESTC
 

dbstop if error
%% record
diary off
[~,filename]=fileparts(mnhs.path_csv);
filename=[mnhs.path_out,filesep,filename,'_',mnhs.tag];
diaryfile=[filename,'_diary.txt'];
test_folder(diaryfile);
diary(diaryfile);
mnhs.time_start=datetime;
mnhs = mnhs.mnhfun(mnhs);%
%% only for model compare
if isfield(mnhs,'only_criteria')&& mnhs.only_criteria
    warning('not save T and tregs, to save time')
    mnhs.T=[];
    mnhs.tregs=[];
end
%% save result
filename=[filename,'.csv'];
writetable(mnhs.Ttest,filename);
disp(['finish ',mfilename,'-',func2str(mnhs.mnhfun),'-',mnhs.tag,' for ',filename]);
mnhs.time_finish=datetime;
diary off
