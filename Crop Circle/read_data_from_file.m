%% AAFC data files
clc
clear all
%%
for i = 1:17
    j = num2str(i);
    file = strcat('Raw_Data_', j, '.txt');
    
a = load (file);       
R1_Mean(i,:) = mean(a);
R1_SD(i,:) = std(a);

end

subplot(3,1,1), plot(R1_Mean(:,1))
grid on
subplot(3,1,2), plot(R1_Mean(:,2))
grid on
subplot(3,1,3), plot(R1_Mean(:,3))
grid on