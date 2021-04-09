close all; clear; clc;
cd C:\Users\betul\Desktop\Bitirme\frekans_emg\4.YSA_ve_Sonuçların_Hesaplanması\w_nr\veriler\ozellik_1
load Data_w_nr
cd C:\Users\betul\Desktop\Bitirme\frekans_emg\4.YSA_ve_Sonuçların_Hesaplanması\fonksiyon
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