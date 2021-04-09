close all; clear; clc;
cd C:\Users\betul\Desktop\Bitirme2\4.YSA_ve_Sonuçların_Hesaplanması\EMG\h_a\veriler\ozellik_1
load data_hafif_agir_f
cd C:\Users\betul\Desktop\Bitirme2\4.YSA_ve_Sonuçların_Hesaplanması\EMG\fonksiyon
%% Veri Seti - Eğitim - Test
[Egitim, Egitimc, Test, Testc] = orneklem(data);

%% kNN - Sınıflandırıcı
classificationTree = fitctree(...
    Egitim, ...
    Egitimc, ...
    'SplitCriterion', 'gdi', ...
    'MaxNumSplits', 100, ...
    'Surrogate', 'off', ...
    'ClassNames', [1; 2]);
% [trainedClassifier, validationAccuracy] = trainClassifier(Data)

%% Performans Değerlendirme
Egitims=predict(classificationTree,Egitim);
[Per_Par]=Perf(Egitimc, Egitims);

%% Test Soruları
Tests=predict(classificationTree,Test);
Test_Perf=Perf(Testc, Tests);