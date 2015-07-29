%This code generates data using the simple thresholding technique and
%simple abbreviation of the position data and runs the GLM on it, both
%a simple LM and an exponential GLM

Animal1Trial1Spikes=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_121\Session1');
save('SpikeDataRat121S1.mat','Animal1Trial1Spikes')
clear Animal1Trial1Spikes
Animal1Trial2Spikes=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_121\Session2');
save('SpikeDataRat121S2.mat','Animal1Trial2Spikes')
clear Animal1Trial2Spikes
Animal1Trial3Spikes=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_121\Session3');
save('SpikeDataRat121S3.mat','Animal1Trial3Spikes')
clear Animal1Trial3Spikes

%D=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_121\Session4');

Animal2Trial1Spikes=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_122\Session1');
save('SpikeDataRat122S1.mat','Animal2Trial1Spikes')
clear Animal2Trial1Spikes
Animal2Trial2Spikes=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_122\Session2');
save('SpikeDataRat122S2.mat','Animal2Trial2Spikes')
clear Animal2Trial2Spikes

%save('PracticeSpikeDataRat121S4.mat','D')
% 
Animal1Trial1LM=ratGLM(Animal1Trial1Spikes,'normal','identity',6,1);
save('SpikeLMRat121S1.mat','Animal1Trial1LM')
clear Animal1Trial1LM

Animal1Trial2LM=ratGLM(Animal1Trial2Spikes,'normal','identity',6,1);
save('SpikeLMRat121S2.mat','Animal1Trial2LM')
clear Animal1Trial2LM

Animal1Trial3LM=ratGLM(Animal1Trial3Spikes,'normal','identity',6,1);
save('SpikeLMRat121S3.mat','Animal1Trial3LM')
clear Animal1Trial3LM
 
% save('SpikeLMRat121S2.mat','Animal1Trial2LM')
% save('SpikeLMRat121S3.mat','Animal1Trial3LM')
% %save('PracticeSpikeLMRat121S4.mat','DD')
% 
% save('SpikeLMRat122S1.mat','Animal2Trial1LM')
% save('SpikeLMRat122S2.mat','Animal2Trial2LM')


% Note: Can't do GLM as stands: need non-negative value for all inputs
% (position goes negative)

% AAA=ratGLM(A,'poisson','log',3,1);
% BBB=ratGLM(B,'poisson','log',3,1);
% CCC=ratGLM(C,'poisson','log',3,1);
% DDD=ratGLM(D,'poisson','log',3,1);
% 
% A1A1A1=ratGLM(A1,'poisson','log',3,1);
% B1B1B1=ratGLM(B1,'poisson','log',3,1);
% 
% save('PracticeSpikeGLMRat121S1.mat','AAA')
% save('PracticeSpikeGLMRat121S2.mat','BBB')
% save('PracticeSpikeGLMRat121S3.mat','CCC')
% save('PracticeSpikeGLMRat121S4.mat','DDD')
% 
% save('PracticeSpikeGLMRat122S1.mat','A1A1A1')
% save('PracticeSpikeGLMRat122S2.mat','B1B1B1')