%% Define Timer Fuction
function fcn_scan(obj, event, arg1, arg2, arg3, arg4)% arg3, arg4, arg5,arg6, arg7, arg8)

%% Define Variables
t=arg2;
T = t.TasksExecuted;
m=arg3;
bn=arg4;
bn=num2str(bn);


%% Scan Serial Port
s=arg1;
Data = fscanf(s);
[a b c d e] = strread(Data, '%s %s %s %s %s', 'delimiter', ',');
N_RE = str2double(a);
N_NIR = str2double(b);
N_R = str2double(c);
N_NDRE = str2double(d);
N_NDVI = str2double(e);
t_Time1=event.Data.time(6);
Soil_Data=[N_RE N_NIR N_R N_NDRE N_NDVI];

%% Save Data

file_name1 = 'Raw_Data_';
bin_num = bn;
ext='txt';
name1=strcat(file_name1,bin_num,'.',ext);
save('Soil_Data.txt', 'Soil_Data', '-ascii','-append')
save (name1,'Soil_Data','-ascii','-append')

% %% Plot Data
% figure(1)
% plot(Soil_Data)
% grid on
% hold on

%% Disconnnect Serial Port
if t.TasksExecuted == m/0.05
    delete Soil_Data.txt
    disp('End of Collection')
    zz= load(name1);
    st=length(zz);
    st=st*0.05;
    st=0:0.05:(m-0.05);
            
    subplot(3,1,1),plot(st,zz(:,1))
    grid on
    ylabel('[RE]')
    
    title('Soil reflectance measurements Vs Time')
    
    subplot(3,1,2),plot(st,zz(:,2))
    grid on
    ylabel('[NIR]')
    
    subplot(3,1,3),plot(st,zz(:,3))
    grid on
    ylabel('[R]')
    
    xlabel('Time [50mS/sample]')
    
     
    hold on
    fclose(s)
end
