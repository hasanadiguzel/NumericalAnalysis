#En Kucuk Kareler Yontemi
#n = X ve Y matrislerinin satir sayisi
#X = Kullanicinin girdigi x degerleri / matrisi.
#Y = Kullanicinin girdigi y degerleri / matrisi.
#XX = X matrisinin her elemaninin karesini depolayan matris.
#XY = X ve Y matrislerinin satirlarinin karsilikli carpimini depolayan matris.
#sX = X matrisinin 1. kolonundaki degerlerin toplami.
#sY = Y matrisinin 1. kolonundaki degerlerin toplami.
#sXX = XX matrisinin 1. kolonundaki degerlerin toplami.
#sXY = XY matrisinin 1. kolonundaki degerlerin toplami.
#E = Egri denkleminin matrisi.
#a = E matrisinden bulunan a degeri / egri denkleminin a degeri.
#b = E matrisinden bulunan b degeri / egri denkleminin b degeri.
#fy = Egri denklemidir, x parametresi alýr.
#NY = Egri denklemine X matrisinin degerlerini verdigimizde elde ettigimiz sonuclarý depoladigimiz maris / Y'.
#RMSE = Root Mean Square Error, Ortalama Karakok Sapmasi
#tolerance = RMSE' nin karsilastirilacagi hata payidir.

clear;
clc;

tolerance = 0.1;
X = [0.1;0.3;0.4;0.8;1;1.5;2;2.6;3;3.2];
Y = [2.8;3.5;4.2;5;6.3;8.8;10;12;13.7;15];

n = size(X)(1);

XX = power(X(:,1), 2);
XY = [];
for i=1:n
  XY(i,1) = X(i,1) * Y(i,1);
endfor

sX = sum(X(:,1));
sY = sum(Y(:,1));
sXX = sum(XX(:,1));
sXY = sum(XY(:,1));

E = [sXX,sX,sXY; sX,n,sY]; #equation

for j=1:2
  E(j,:)=E(j,:)/E(j,j);
  for i=j+1:2
    E(i,:)=-E(i,j)*E(j,:)+E(i,:);
  endfor
endfor
for j=2-1:-1:1
  for i=j:-1:1
    E(i,:)=-E(i,j+1)*E(j+1,:)+E(i,:);
  endfor
endfor

a = round(100*E(1, 3))/100;
b = round(100*E(2, 3))/100;

fy = @(x) a*x+b;

NY = round(100*fy(X(:,1)))/100;

RMSE = sqrt(sum(power((Y(:,1)-NY(:,1)), 2))/n);

if RMSE <= tolerance
  printf("Basarili Fonksiyon!");
else
  printf("Basarisiz Fonksiyon!");
endif
printf("\nTolerans Degeri: %d", tolerance);
printf("\n--------------------------------------------\n");
printf("y Fonksiyonu: y(x)= %d * x + %d\n", a, b);
printf("RMSE: %d\n", RMSE);