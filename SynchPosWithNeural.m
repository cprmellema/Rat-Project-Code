function [ position] = SynchPosWithNeural(position,synching)
%Synchs the position data to the neural data

SynchTimes=SpikeSorter( synching.data, 1, 1/synching.fs );

SynchPos=SpikeSorter2( position.GBL_stimulation_enabled, 0.2, position.time_tstamp_msec/1000 );

displacement=SynchPos(1)-SynchTimes(1);

SynchPos=SynchPos-displacement-SynchTimes(1);
SynchPos(1)=0; %This sometimes generated a number like 1.4*10^-30,
%and I want both to start at 0

SynchTimes=SynchTimes-SynchTimes(1);

[n,~]=size(SynchPos);
[m,~]=size(SynchTimes);

length=min(n,m);

SynchPos=SynchPos(1:length,:);
SynchTimes=SynchTimes(1:length,:);

Stretch=(SynchPos(end,:)/SynchTimes(end,:));

position.new_timestamp=((position.time_tstamp_msec/1000)-displacement)*Stretch;


end

