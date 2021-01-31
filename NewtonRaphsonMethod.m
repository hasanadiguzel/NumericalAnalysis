clear;
clc;

#tolerance = Mutlak degerce karsilastirilacak hata payidir.
#iterationCount = Yenileme sayisidir.
#f = Lineer olmayan denklemdir.
#fl = Lineer olmayan denklemin turavidir.
#xPlus = x degerinin bir sonraki degerini bulan fonksiyondur.

tolerance = 0.01;
f=@(x) 3*power(x,3)-2*power(x,2)+12*x-25;
fl=@(x) 9*power(x,2)-4*x+12;
xPlus=@(x) (x-(f(x)/fl(x)));
iterationCount = 1;
x = -4;

while true
  
  xp = round(10000 * xPlus(x)) / 10000;
  x = xp;
  iterationCount++;
  y = f(x);
  
  if abs(y) < tolerance
    break;
  endif
endwhile

printf("x: %d\n", x);
printf("Tolerance: %d\n", round(10000 * y) / 10000);
printf("Iterations Count: %d\n", iterationCount);




















