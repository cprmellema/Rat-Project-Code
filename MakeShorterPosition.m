function [ practicepos ] = MakeShorterPosition( positions, times, fs, newtimesteps )
%This function bins the massive data into a smaller piece where the
%position is only sampled in a smaller bin

positions=positions(1:end-1,:);

times=times(1:end-1,:);
a=times(1,1);
times=times-a;
times=times/1000;

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