%% Define Timer Fuction
function fcn_boxcar(obj, event, arg1, arg2)

%% Define Variables
t1=arg1;
bn=arg2;
bn=num2str(bn);
T1 = t1.TasksExecuted;
load Soil_Data.txt
delete Soil_Data.txt
M = mean(Soil_Data);
SD = std(Soil_Data);

%% Save Data
file_name2 = 'M_Data_';
bin_num = bn;
ext='txt';
name2=strcat(file_name2,bin_num,'.',ext);

file_name3 = 'SD_Data_';
bin_num = bn;
ext='txt';
name3=strcat(file_name3,bin_num,'.',ext);


save(name2, 'M', '-ascii','-append')
save(name3, 'SD', '-ascii','-append')

%% Disconnnect Serial Port
if t1.TasksExecuted == 40
%     load M_Soil_Data.txt
%     load SD_Soil_Data.txt
%     figure(2)
%     plot(M_Soil_Data)
%     hold on
%     plot(SD_Soil_Data)
%     grid on
end