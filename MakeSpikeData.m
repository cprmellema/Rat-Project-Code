function [ spikematrix ] = MakeSpikeData( folderpath )
%%makes a matrix of spikes for a given folder of the rat data

addpath(folderpath);

files=dir(fullfile(folderpath,'*.mat'));
[n,~]=size(files);

for i=1:length(files)
   if strcmp(files(i,1).name(1,1:10),'trial_data')
       posname=files(i,1).name;
       files(i,:)=[];
   elseif strcmp(files(i,1).name(1,end-8:end-4),'adc11')
       synchingname=files(i,1).name(1,1);
       files(i,:)=[];
   end
   
end

load(posname);
position=dataStruct;
load(sychingname);
synching=dataStruct;

clear dataStruct

synched_position=SynchNeuralWithPos(position,synching);

%%sets width of timebin of practice data
timebins=0.2;

for i=1:length(files)
    
    name=files(i,1).name;
    load(name);
    fs=dataStruct.fs;
    spikearray{1,i}=MakePracticeSpikes(SpikeSorter(RatDataMatlabBPFilter(dataStruct.data),0.75*10^-3,1/dataStruct.fs),timebins);
    
end
 
spikebintimes=((1:length(spikearray))*timebins)';

spikearray{1,n}=InterpolatePosition(synched_position.GBL_x_axis,synched_position.new_timestamp,spikebintimes);
spikearray{1,n+1}=InterpolatePosition(synched_position.GBL_y_axis,synched_position.new_timestamp,spikebintimes);

a=length(spikearray{1,1});

for i=1:length(spikearray)
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

