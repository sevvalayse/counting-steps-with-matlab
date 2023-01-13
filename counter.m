clear all
a=readmatrix('walking.txt');


t=1:size(a,1);
figure
plot(t,a);
legend('X','Y','Z');
xlabel('Relative time (s)');
ylabel('Acceleration (m/s^2)');

x=a(:,1);
y=a(:,2);
z=a(:,3);

mag=sqrt(sum(x.^2+y.^2+z.^2,2));

figure
plot(t,mag);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2');

magNoG=mag-mean(mag);
figure
plot(t,magNoG);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Mean')


minPeakHeight=std(magNoG);
[pks,locs]=findpeaks(magNoG,'MINPEAKHEIGHT',minPeakHeight);
numSteps=numel(pks)