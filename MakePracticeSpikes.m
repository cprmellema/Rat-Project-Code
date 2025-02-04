function [ practicespikes ] = MakePracticeSpikes( spiketimes, newtimesteps )
%This function bins the massive data into a smaller piece where the
%spiketimes are convertend into 0/1 spikes within a specific time window

    if ~isempty(spiketimes)
               
        oldlength=ceil(spiketimes(length(spiketimes)));

        newlength=ceil(oldlength/newtimesteps);

        practicespikes=zeros(newlength,1);

        for i=1:length(spiketimes)
           time=spiketimes(i);
           newslot=ceil(time/newtimesteps);
           practicespikes(newslot,1)=practicespikes(newslot,1)+1;
        end
        
    else
        practicespikes=zeros(100000,1);
    end

end

