function [ spikematrix ] = MakeSpikeData( folderpath )
%%makes a matrix of spikes for a given folder of the rat data

addpath(folderpath);

files=dir(fullfile(folderpath,'*.mat'));
[n,~]=size(files);
spikearray={};

i=1;
while i<=length(files)

   if strcmp(files(i,1).name(1,end-8:end-4),'_COM5')
       posname=files(i,1).name;
       files(i,:)=[];
       i=i-1;
   elseif strcmp(files(i,1).name(1,end-8:end-4),'adc11')
       synchingname=files(i,1).name;
       files(i,:)=[];
       i=i-1;
   end
   i=i+1;
end

load(posname);
position=dataStruct;
load(synchingname);
synching=dataStruct;

clear dataStruct

synched_position=SynchPosWithNeural(position,synching);

%%sets width of timebin of practice data and the threshold for spike
%%detection

timebins=0.005;
threshold=0.2*10^-3;

for i=1:length(files)
    
    name=files(i,1).name;
    load(name);
    fs=dataStruct.fs;
    spikearray{1,i}=MakePracticeSpikes(SpikeSorter(RatDataMatlabBPFilter(dataStruct.data),threshold,1/dataStruct.fs),timebins);
    
end
 
a=length(spikearray{1,1});

for i=1:length(spikearray)
    a=min(a,length(spikearray{1,i}));
end

for i=1:length(spikearray)
   spikearray{1,i}=spikearray{1,i}(1:a,1); 
end

spikebintimes=((1:length(spikearray{1,1}))*timebins)';

spikearray{1,n-1}=InterpolatePosition(synched_position.GBL_x_axis,synched_position.new_timestamp,spikebintimes);
spikearray{1,n}=InterpolatePosition(synched_position.GBL_y_axis,synched_position.new_timestamp,spikebintimes);

a=length(spikearray{1,1});

for i=1:length(spikearray)
    a=min(a,length(spikearray{1,i}));
end

for i=1:length(spikearray)
   spikearray{1,i}=spikearray{1,i}(1:a,1); 
end

for i=1:length(spikearray)
    spikematrix(:,i)=spikearray{:,i};
end

clear a
clear files
clear name
clear fs

end

