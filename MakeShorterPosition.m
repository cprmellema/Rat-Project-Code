function [ practicepos ] = MakeShorterPosition( positions, times, newtimesteps )
%This function bins the massive data into a smaller piece where the
%position is only sampled in a smaller bin

newlength=ceil(times(end,:)/newtimesteps);

practicepos=zeros(newlength,1);

for i=1:newlength
   time=i*newtimesteps;
   newslot=round(time/newtimesteps);
   oldslot=floor((newslot/newlength)*length(positions)+1);
   oldslot=min(length(positions),oldslot);
   practicepos(newslot,1)=positions(oldslot,1);
end

end