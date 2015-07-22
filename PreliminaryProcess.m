%This code generates data using the simple thresholding technique and
%simple abbreviation of the position data and runs the GLM on it, both
%a simple LM and an exponential GLM

A=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_121\Session1');
B=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_121\Session2');
C=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_121\Session3');
D=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_121\Session4');

A1=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_122\Session1');
B1=MakeSpikeData('C:\Users\Cooper\Desktop\Documents\School\Post-Bac\Rat experiment (Sum2015-present)\data_tdt_sessions\Animal_122\Session2');

save('PracticeSpikeDataRat121S1.mat','A')
save('PracticeSpikeDataRat121S2.mat','B')
save('PracticeSpikeDataRat121S3.mat','C')
save('PracticeSpikeDataRat121S4.mat','D')

save('PracticeSpikeDataRat122S1.mat','A1')
save('PracticeSpikeDataRat122S2.mat','B1')

AA=ratGLM(A,'normal','identity',3,1);
BB=ratGLM(B,'normal','identity',3,1);
CC=ratGLM(C,'normal','identity',3,1);
DD=ratGLM(D,'normal','identity',3,1);

A1A1=ratGLM(A1,'normal','identity',3,1);
B1B1=ratGLM(B1,'normal','identity',3,1);

save('PracticeSpikeLMRat121S1.mat','AA')
save('PracticeSpikeLMRat121S2.mat','BB')
save('PracticeSpikeLMRat121S3.mat','CC')
save('PracticeSpikeLMRat121S4.mat','DD')

save('PracticeSpikeLMRat122S1.mat','A1A1')
save('PracticeSpikeLMRat122S2.mat','B1B1')


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