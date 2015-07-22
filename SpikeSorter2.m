function [ spiketimes ] = SpikeSorter2( spikeset, threshold, timesteps )

%   Runs a spike-sorting algorithm on a set of spikes

spiketimes=[];

%%   First, we threshold the dataset to find spike candidates

for i=2:(length(spikeset))
    if spikeset(i)>=threshold&&spikeset(i-1)<threshold
        spiketimes=[spiketimes;timesteps(i)];
    end
end


%%   Next, we... ???

end

