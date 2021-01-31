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

for i=1:n
  S(i) = f(a+(i-1)*h) * h;
endfor

disp("Result: ");
disp(sum(S(1,:)));








