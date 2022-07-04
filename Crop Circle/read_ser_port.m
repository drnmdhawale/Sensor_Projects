%%
clc
clear all
% delete M_Soil_Data.txt
% delete SD_Soil_Data.txt
% delete RAW_Data.txt
%% USER Inputs 
wd_boxcar = input('Enter value of boxcar width, Choose integers from 2,5 or 10: ', 's');
if isempty(wd_boxcar)
    wd_boxcar = '1';
end
n = str2double(wd_boxcar);
%%
time_scan = input('Enter value for scan time in seconds, Choose integers from 15,30 or 60: ', 's');
if isempty(time_scan)
    time_scan = '10';
end
m = str2double(time_scan);

%%

bin_num = input('Enter value of Bin No., Choose between available 1,2, ,50: ', 's');
bn = str2double(bin_num);

%% Define some variable
% O_RE=0; O_NIR=0; O_R=0; O_NDRE=0; O_NDVI=0;
% save O_RE; save O_NIR; save O_R; save O_NDRE; save O_NDVI
% a=0; b=0;c=0;d=0;e=0;n=0;

%% Define Serial Port Object
oldSerial = instrfind('Port', 'COM1');  % Check to see if there are existing serial objects (instrfind) whos 'Port' property is set to 'COM1'
% can also use instrfind() with no input arguments to find ALL existing serial objects
if (~isempty(oldSerial))  % if the set of such objects is not(~) empty
    disp('WARNING:  COM1 in use.  Closing.');
    delete(oldSerial);
end

%%
s = serial('com1'); %assigns the object s to serial port
set(s, 'InputBufferSize', 1000);
set(s, 'FlowControl', 'hardware');
set(s, 'BaudRate', 38400);
set(s, 'Parity', 'none');
set(s, 'DataBits', 8);
set(s, 'StopBit', 1);
set(s, 'Timeout', 1);

%% Connect Serial Port
fopen(s); 
          
%% Define Timer-1 Object for reading the samples

oldtimer = timerfind();  % Check to see if there are existing timer objects
if (~isempty(oldtimer))  % if the set of such objects is not(~) empty
    disp('WARNING:  timer in use.  Closing.');
    delete(oldtimer);
end
t = timer('StartDelay', 1, 'Period', 0.05, 'TasksToExecute', m/0.05, ...
          'ExecutionMode', 'fixedRate');

t.TimerFcn = {@fcn_scan, s, t, m, bn};% a, b, c, d, e, n};

%% Define Timer-2 Object for box car width integration

if n > 1
    
    t1 = timer('StartDelay', 1, 'Period', 0.05*n, 'TasksToExecute', m/(n*0.05), ...
          'ExecutionMode', 'fixedRate');
    t1.TimerFcn = {@fcn_boxcar, t1, bn};
end

%% Start the timer objects:
start(t)

if n > 1
   start(t1)
end




