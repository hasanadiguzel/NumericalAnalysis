clear;
clc;

#f = Integral fonksiyonudur.
#a = Baslangic noktasidir.
#b = Bitis noktasidir.
#n = Egri altinda kalan alanin bolunecegi parca sayisidir. Yukseldikce sonucun dogrulugu artar.
#h = Delta, D, h sayisidir.

f=@(x) 3*power(x,2)-4*x;
a = 0;
b = 1;
n = 10;
h = (b-a)/n;

for i=1:n-1
  S(i) = f(a+i*h);
endfor

total = (h/2)*(f(a)+f(b)+2*sum(S(1,:)));

disp("Result: ");
disp(total);

