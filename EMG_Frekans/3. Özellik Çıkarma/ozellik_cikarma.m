clc;clear all;
load('emg_ozellik.mat')
%% Ortalama,Standart Sapma,Varyans
for e=1:1079
ortalama(e)=mean(Epoklar(1:30,e));
s_s(e)=std(Epoklar(1:30,e));
varyans(e)=var(Epoklar(1:30,e));
end

%% Çýkýþ Fonksiyonu
input1=[ortalama' s_s' varyans' ];