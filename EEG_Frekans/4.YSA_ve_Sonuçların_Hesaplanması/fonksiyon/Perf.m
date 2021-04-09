function [Per_Par]=Perf(egitimc, egitims)
% Performans parametrelerinin hesaplanmasý
% Verilerin yüklenmesi
% close all ; clear all ; clc ;
% load Performans
%%
% gercek_sonuclar = egitimc ;
% simulasyon_sonuclari = egitims ;
% crosstab komutu ile sonuçlarýn çapraz tabloya aktarýlmasý
% Gerçek sonuçlar tablosunun solunda, simulasyon sonuçlarý ise tablo
% üstünde olmalýdýr.
capraz_tablo = crosstab(egitimc, egitims) ;
if size(capraz_tablo,2)==1
    capraz_tablo(2,2)=0;
    capraz_tablo(2,1)=0;
end
% Tablonun sað tarafýndaki toplamlarýn yazýdýrlmasý
capraz_tablo(1,3) = capraz_tablo(1,1) + capraz_tablo(1,2) ;
capraz_tablo(2,3) = capraz_tablo(2,1) + capraz_tablo(2,2) ;
% Tablonun alt tarafýndaki toplamlarýn yazýdýrlmasý
capraz_tablo(3,1) = capraz_tablo(1,1) + capraz_tablo(2,1) ;
capraz_tablo(3,2) = capraz_tablo(1,2) + capraz_tablo(2,2) ;
capraz_tablo(3,3) = capraz_tablo(3,1) + capraz_tablo(3,2) ;

%% Apne için Sýnýf doðruluk oraný, Sensivity ve specificity deðerlerinin hesaplanmasý
TP = capraz_tablo(1,1) ;
FN = capraz_tablo(1,2) ;
TN = capraz_tablo(2,2) ;
FP = capraz_tablo(2,1) ;
% Doðruluk Oraný
Acc = (TP+TN)/(TP+TN+FP+FN)*100 ;
% Sensivity
Sen = TP / (TP+FN) ;
% Specificity
Spe = TN / (TN+FP) ;
% F-Ölçümü
F_O = (2 * Sen * Spe) / (Sen + Spe) ;
% Kappa
Kappa = cohenskappa(egitimc, egitims) ;
% AUC Deðerinin Hesaplanmasý
[AUC] = AUC_hesaplama(egitimc, egitims) ;
% Deðerlerin birleþtirilmesi
Per_Par=[Acc Sen Spe F_O Kappa AUC];
end