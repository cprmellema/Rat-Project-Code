function [ interp_pos ] = InterpolatePosition( positions, times, spiketimes )
%This function bins the massive data into a smaller piece where the
%position is only sampled in a smaller bin

times(end,:)=[];
positions(end,:)=[];
endtime=min(spiketimes(end,1),times(end,1));

if spiketimes(end,1)>times(end,1)
   n=length(spiketimes);
   for i=1:n
      
      if i>=length(spiketimes)
           break 
      elseif spiketimes(i,1)>endtime
         spiketimes(i:end,:)=[]; 
      end
   end    
else
    
    n=length(times);
    for i=1:n
     
        if i>=length(times)
           break
        elseif times(i,1)>endtime
           times(i:end,:)=[];
        end
    end
    
end

interp_pos=zeros(length(spiketimes),1);

j=1;

for i=1:length(interp_pos)
    
   if spiketimes(i)>times(j)
       j=j+1;
   end
   
   interp_pos(i)=positions(j);
   
end

end