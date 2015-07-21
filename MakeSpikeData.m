function [ spikematrix ] = MakeSpikeData( folderpath )
%%makes a matrix of spikes for a given folder of the rat data

addpath(folderpath);

files=dir(fullfile(folderpath,'*.mat'));
files=files(1:end,:);
[n,~]=size(files);

for i=1:n-1
    
    name=files(i,1).name;
    load(name);
    fs=dataStruct.fs;
    spikearray{1,i}=MakePracticeSpikes(SpikeSorter(dataStruct.data,0.75*10^-3,1/dataStruct.fs),0.2);
    
end

name=files(n,1).name;
load(name);

spikearray{1,n}=MakeShorterPosition(dataStruct.GBL_x_axis,dataStruct.time_tstamp_msec,fs,0.2);
spikearray{1,n+1}=MakeShorterPosition(dataStruct.GBL_y_axis,dataStruct.time_tstamp_msec,fs,0.2);

a=length(spikearray{1,1});

for i=2:length(spikearray)
    a=min(a,length(spikearray{1,i}));
end


for i=1:length(spikearray)
    spikematrix(:,i)=spikearray{:,i}(1:a,:);
end

clear a
clear spikearray
clear files
clear name
clear fs

end

