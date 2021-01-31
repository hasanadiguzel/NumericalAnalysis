clear;
clc;

#Gauss Jordan Yöntemi

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

for j=N-1:-1:1
  for i=j:-1:1
    G(i,:)=-G(i,j+1)*G(j+1,:)+G(i,:);
  endfor
endfor

X=round(G(:,M));

for i=1:N
  disp(X(i));
endfor
