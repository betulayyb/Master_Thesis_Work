close all; clear; clc;
cd C:\Users\betul\Desktop\frekans\4.YSA_ve_Sonuçların_Hesaplanması\h_a\veriler\ozellik_1
load Data_hafif_agir
cd C:\Users\betul\Desktop\frekans\4.YSA_ve_Sonuçların_Hesaplanması\fonksiyon

%% Veri Seti - Eğitim - Test
[Egitim, Egitimc, Test, Testc] = orneklem(data);

%% kNN - Sınıflandırıcı
subspaceDimension = max(1, min(3, width(Egitim) - 1));
classificationEnsemble = fitcensemble(...
    Egitim, ...
    Egitimc, ...
    'Method', 'Subspace', ...
    'NumLearningCycles', 30, ...
    'Learners', 'knn', ...
    'NPredToSample', subspaceDimension, ...
    'ClassNames', [1; 2]);
% [trainedClassifier, validationAccuracy] = trainClassifier(Data)

%% Performans Değerlendirme
Egitims=predict(classificationEnsemble,Egitim);
[Per_Par]=Perf(Egitimc, Egitims);

%% Test Soruları
Tests=predict(classificationEnsemble,Test);
Test_Perf=Perf(Testc, Tests);