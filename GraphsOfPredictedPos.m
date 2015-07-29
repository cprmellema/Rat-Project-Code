plot(Animal1Trial2LM.muhat(:,18),'.')
hold on
plot(Animal1Trial2Spikes(:,18),'r')
xlabel('Time (arbitrary units)')
ylabel('X position')
title('Predicted (blue) vs actual (red) position')
figure

plot(Animal1Trial2Spikes(:,18)-Animal1Trial2LM.muhat(:,18))
xlabel('Time (arbitrary units)')
ylabel('Actual X position - predicted')
title('Actual-Predicted X position')
figure

plot(Animal1Trial2LM.muhat(:,17),'.')
hold on
plot(Animal1Trial2Spikes(:,17),'r')
xlabel('Time (arbitrary units)')
ylabel('Y position')
title('Predicted (blue) vs actual (red) position')
figure

plot(Animal1Trial2Spikes(:,17)-Animal1Trial2LM.muhat(:,17))
xlabel('Time (arbitrary units)')
ylabel('Actual Y position - predicted')
title('Actual-Predicted Y position')
figure

plot(Animal1Trial3LM.muhat(:,18),'.')
hold on
plot(Animal1Trial3Spikes(:,18),'r')
xlabel('Time (arbitrary units)')
ylabel('X position')
title('Predicted (blue) vs actual (red) position')
figure

plot(Animal1Trial3Spikes(:,18)-Animal1Trial3LM.muhat(:,18))
xlabel('Time (arbitrary units)')
ylabel('Actual X position - predicted')
title('Actual-Predicted X position')
figure

plot(Animal1Trial3LM.muhat(:,17),'.')
hold on
plot(Animal1Trial3Spikes(:,17),'r')
xlabel('Time (arbitrary units)')
ylabel('Y position')
title('Predicted (blue) vs actual (red) position')
figure

plot(Animal1Trial3Spikes(:,17)-Animal1Trial3LM.muhat(:,17))
xlabel('Time (arbitrary units)')
ylabel('Actual Y position - predicted')
title('Actual-Predicted Y position')
figure