clear;
clc;

#tolerance = Mutlak degerce karsilastirilacak hata payidir.
#mp = middle point - orta nokta
#iterationCount = Yenileme sayisidir.
#f = Lineer olmayan denklemdir.
#c = Orta nokta bulma fonksiyonudur.
#abPoints = a ve b noktalarini barindiran matrisdir.

tolerance = 0.001;
abPoints = [-2, 2];
f=@(x) 3*power(x,3)-2*power(x,2)+12*x-25;
c=@(a,b,fa,fb) (a*fb-b*fa)/(fb-fa);
iterationCount = 0;

while true
  a = abPoints(1);
  b = abPoints(2);
  fa= f(a);
  fb = f(b);
  mp = round(10000*c(a,b,fa,fb))/10000;
  fc = f(mp);

  if fc > 0
    abPoints(2) = mp;
  else
    abPoints(1) = mp;
  endif
  
  iterationCount++;
  
  if abs(fc) < tolerance
    printf("x: %d\n", mp);
    printf("Iteration Count: %d\n", iterationCount);
    break;
  endif
endwhile
