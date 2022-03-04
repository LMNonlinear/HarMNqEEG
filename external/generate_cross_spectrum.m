% take care of the format of the raw data;
%                         the input type of metadata
%                         the electrodes name and order
%                         the sex used, better use F/M
% encrypt the subject name before this script
clear;clc;
country='Malaysia';
inform_path='.\inform\';
file_path='.\dataset\'; 
germ = dir([file_path,'*cleaned.set']);
load([inform_path,'cname.mat']);
% metadata=readtable([inform_path,'Participants_LEMON.csv'],'ReadVariableNames',true);
eeg_device='ANT Neuro';
savepath='.\result\';
rename_chan={'T3','T4','T5','T6'};
%% load ste and calculate crossSpec Using code form Bosch
for i=1:size(germ,1)
     try      
        EEG = pop_loadset('filename',germ(i).name,'filepath',file_path);
        chan = struct2table(EEG.chanlocs); chan = chan.labels;
        ind=find_char(chan,{'T7','T8','P7','P8'});
        chan(ind)=rename_chan;
        indx=find_char(cname,chan);
        data=EEG.data(indx,:,:);
        data_code=EEG.filename(1:end-4);
        info=metadata(strncmp(metadata.ID, data_code,10),:);
        age=char(info.Age);
        sex=info.Gender;
        [data_struct, error_msg] = data_gatherer(data, EEG.srate, cname,data_code , ...
            EEG.ref, age, sex, country, eeg_device);
      
        test_folder([savepath,country]);
        save([savepath,country,'\',data_code],'data_struct','error_msg');
    catch ME
        fprintf('organize fail for #%s: %s\n', data_code,ME.message);
    end
end

T = struct2table(data_table);
% xlsxname = 'MultiDataInfo998.xlsx';
% writetable(T,[copy_path,xlsxname],'Sheet','subsInfor','Range','A1');
xlsxname = ['MultiDataInfo_',countryname,'.csv'];
writetable(T,[copy_path,filesep,xlsxname])




