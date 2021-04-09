clc;clear all;
load('eeg_ozellik.mat')
%% Ortalama,Standart Sapma,Varyans
for e=1:1079
ortalama(e)=mean(Epoklar(1:30,e));
s_s(e)=std(Epoklar(1:30,e));
varyans(e)=var(Epoklar(1:30,e));

end
%% Ortalama Enerji
for j=1:1079
    toplam=0;
    for o=1:30
        s=Epoklar(o,j)^2;
        toplam=toplam+s;
    end
    E(j)=toplam/30;
end
%% Ortalama Eðri Uzunluðu
for r=2:1078
    toplam=0;
    for t=2:30
        s=Epoklar(t,r)-Epoklar(t-1,r-1);
        toplam=toplam+s;
    end
    CL(r)=toplam/30;
end
CL(1079)=0;
%% Ortalama Teager Enerjisi 
for r=3:1077
    toplam=0;
    for t=3:30
        s=((Epoklar(t-1,r-1))^2)-(Epoklar(t,r)*Epoklar(t-2,r-2));
        toplam=toplam+s;
    end
    TE(r)=toplam/30;
end
TE(1078)=0;
TE(1079)=0;
for r=3:1077
    toplam=0;
    for t=3:30
    max_tepe=abs(Epoklar(1:30,e));
    end
end
%% Çýkýþ Fonksiyonu
input=[ortalama' s_s' varyans' E' CL' TE' ];