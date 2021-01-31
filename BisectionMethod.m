clear;
clc;

function returnedVal = EgriFonksiyonu(x)
  returnedVal = (5*power(x, 3)+3*power(x, 2)-2*x-8);
endfunction

EsikDeger = 0.01;
AraNokta = 0;
IterasyonSayisi = 0;

X = [-2, 2];

while true
  IterasyonSayisi++;
  X(3) = (X(1) + X(2)) / 2;
  AraNokta = X(3);
  
  FX(1) = EgriFonksiyonu(X(1));
  FX(2) = EgriFonksiyonu(X(2));
  FX(3) = EgriFonksiyonu(X(3));

  if (FX(1)>0 && FX(3)<0) || (FX(1)<0 && FX(3)>0)
    X = [X(1), X(3)];
  elseif (FX(2)>0 && FX(3)<0) || (FX(2)<0 && FX(3)>0)
    X = [X(3), X(2)];
  endif
  
  if abs(FX(3)) < EsikDeger
    break;
  endif
endwhile

printf("Iterasyon Sayisi: %d\n", IterasyonSayisi);
printf("X: %d\n", round(10000*AraNokta)/10000);


