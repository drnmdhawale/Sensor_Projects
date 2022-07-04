clear all
tic
clc

%data=[1; 2; 3; 4; 5; 6; 7; 8; 9; 8; 7; 6; 5; 4; 3; 2; 1; 2; 3; 4; 5; 6; ...
     % 7; 8; 9; 0; 9; 8; 7; 6; 5; 4; 3; 2; 1;];
    data1 = random('Poisson',1:100,1,100);
    data=data1'
l=length(data);
oldtime=1:1:l;
j=1;

%%
for i=1:5:l
    RE(j,1)=data(i,1);
    j=j+1;
end

%%
j=1;
for i=2:5:l
    NIR(j,1)=data(i,1);
    j=j+1;
end

%%
j=1;
for i=3:5:l
    R(j,1)=data(i,1);
    j=j+1;
end

%%
j=1;
for i=4:5:l
    NDRE(j,1)=data(i,1);
    j=j+1;
end

%%
j=1;
for i=5:5:l
    NDVI(j,1)=data(i,1);
    j=j+1;
end
toc
%%
clear oldtime
time=1:(length(RE));

%%
msgbox('choose 1,3 or 5')
BCF=input('Enter the width of the box car filter ', 's');
msgbox('You have entered', BCF)

%%
plot(time,RE)
hold on
waitforbuttonpress

plot(time,NIR)
hold on
waitforbuttonpress

plot(time,R)
hold on
waitforbuttonpress

plot(time,NDRE)
hold on
waitforbuttonpress

plot(time,NDVI)



