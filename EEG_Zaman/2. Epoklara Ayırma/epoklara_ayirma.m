clc;clear all;
%% EOG_L Epoklama
load('EEG.mat');
[~, ~, isimler] = xlsread('G:\Desktop\Bitirme\isimler.xlsx','Sheet1');
isimler(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),isimler)) = {''};
bas=1;bit=30;g=bit;
for j=1:fix(length(val)/g)
    for i=bas:bit
    isimler{j,:}=val(bas:bit);
    end
    bas=bas+30;
    bit=bit+30;
end
%% from the Cell Ýsimler to Matrix Epoklar 
Epoklar=[];
for j=1:fix(length(val)/g)
    for i=1:30 
       Epoklar(i,j)= isimler{j,1}(i);
    end
end
