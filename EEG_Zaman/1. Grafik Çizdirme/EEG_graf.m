clc;clear all;
%% GRAFÝK ÇÝZDÝRME
load('EEG.mat');
fid = fopen('EEG.info', 'rt');
fgetl(fid);
fgetl(fid);
fgetl(fid);
[frekans] = sscanf(fgetl(fid), 'Sampling frequency: %f Hz  Sampling interval: %f sec');
aralik = frekans(2);
fgetl(fid);
for i = 1:size(val, 1)
       R = strsplit(fgetl(fid), char(9));
       signal{i} = R{2};
       gain(i) = str2num(R{3});
       base(i) = str2num(R{4});
       units{i} = R{5};
end
fclose(fid);
val(val==-32768) = NaN;
for i = 1:size(val, 1)
    val(i, :) = (val(i, :) - base(i)) / gain(i);
end
t = (1:size(val, 2)) * aralik;
plot(t', val');
for i = 1:length(signal)
    labels{i} = strcat(signal{i}, ' (', units{i}, ')'); 
end
legend(labels);
xlabel('Time (sec)'); grid 

