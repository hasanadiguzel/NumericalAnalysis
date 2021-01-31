clear;
clc;

#Gauss Eliminsasyon Yöntemi

A=[3,-5,47,30;11,16,17,10;56,22,11,-18;17,66,-12,7];
B=[-114;6;125;147];

G=[A, B];

[N,M]=size(G);

for j=1:N
  G(j,:)=G(j,:)/G(j,j);
  for i=j+1:N
    G(i,:)=-G(i,j)*G(j,:)+G(i,:);
  endfor
endfor 

X(N) = round(G(N, M));
for i=N-1:-1:1
  temp = 0;
  for j=i+1:N
    temp -= (G(i,j)*X(j));
  endfor
  X(i)=round(G(i,M)+temp);
endfor

for i=1:N
  disp(X(i));
endfor
