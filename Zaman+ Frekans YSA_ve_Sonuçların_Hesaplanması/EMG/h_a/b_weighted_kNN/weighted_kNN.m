close all; clear; clc;
cd C:\Users\betul\Desktop\Bitirme2\4.YSA_ve_Sonuçların_Hesaplanması\EMG\h_a\veriler\ozellik_1
load data_hafif_agir_f
cd C:\Users\betul\Desktop\Bitirme2\4.YSA_ve_Sonuçların_Hesaplanması\EMG\fonksiyon
%% Veri Seti - Eğitim - Test
[Egitim, Egitimc, Test, Testc] = orneklem(data);

%% kNN - Sınıflandırıcı
classificationKNN = fitcknn(...
    Egitim, ...
    Egitimc, ...
    'Distance', 'Euclidean', ...
    'Exponent', [], ...
    'NumNeighbors', 10, ...
    'DistanceWeight', 'SquaredInverse', ...
    'Standardize', true, ...
    'ClassNames', [1; 2]);


% [trainedClassifier, validationAccuracy] = trainClassifier(Data)

%% Performans Değerlendirme
Egitims=predict(classificationKNN,Egitim);
[Per_Par]=Perf(Egitimc, Egitims);

%% Test Soruları
Tests=predict(classificationKNN,Test);
Test_Perf=Perf(Testc, Tests);