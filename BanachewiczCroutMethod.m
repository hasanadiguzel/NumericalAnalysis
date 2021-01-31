clear;
clc;


A=[3,-5,47,30;11,16,17,10;56,22,11,-18;17,66,-12,7];
C=[-114;6;125;147];

G=[A, C];

[N,M]=size(G);

#h matrisini ust ucgensel matris haline ceviriyoruz.
h = A;
for j=1:N
  h(j,:)=h(j,:)/h(j,j);
  for i=j+1:N
    h(i,:)=-h(i,j)*h(j,:)+h(i,:);
  endfor
end

#g ve h matrislerinin carpimi a matrisini vermesi gerektigi icin
#h matrisi kullanilarak g alt ucgensel matrisi olusturuyoruz.
g = A(:,1);
for j=2:N
  for k=j:N
    cache = 0;
    for i=1:(j-1)
      cache -= g(k,i) * h(i,j);
    endfor
    g(k,j) = A(k,j) + cache;
  endfor
endfor

X(1) = C(1) / g(1,1);
for j=2:N
  cache = 0;
  for i=1:(j-1)
    cache -= g(j,i) * X(i);
  endfor
  X(j) = (C(j) + cache) / g(j,j);
endfor

for j=(N-1):-1:1
  cache = 0;
  for i=N:-1:j+1
    cache -= X(i) * h(j, i);
  endfor
  X(j) = X(j) + cache;
endfor

for j=1:N
  fprintf ("X%d: %d\n", j, X(j));
endfor
