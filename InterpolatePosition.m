function [ interp_pos ] = InterpolatePosition( positions, times, spiketimes )
%This function bins the massive data into a smaller piece where the
%position is only sampled in a smaller bin. Spiketimes is the matrix that
%records the electric impulses as recorded by the other recording device,
%and times is the length of the electric impulses as recorded by the first
%device. We want to synchronize the two impulses

%The interpolated positions MUST be wanted at a higher time resolution than
%the original positions. (IE, if the original positions were sampled at a
%rate of 10 Hz, the interpolated positions can give 100 HZ data, but not 1
%Hz data)

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

for i=1:length(times)
    if i>=length(times)
        break
    elseif times(i)<0
        times(i)=[];
        positions(i)=[];
    end
end

j=1;

for i=1:length(interp_pos)
    
   if spiketimes(i)>times(j)
       j=j+1;
   end
   
   interp_pos(i)=positions(j);
   if i>=length(interp_pos)
       break
   end
   if j>=length(times)
       break
   end
   
end

end