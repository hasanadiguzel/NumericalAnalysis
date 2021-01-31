clear;
clc;
fprintf("===Jakobi �terasyonu Program�===\n");
fprintf("--Geli�tirici: Hasan Ad�g�zel-- \n \n");

#A=[11,2,-1,1;2,-13,1,-2;1,-1,9,1;3,-2,-2,15];
#B=[16;-25;-10;1];

A = input("L�tfen A Matrisini tan�mlay�n�z: ");
if ismatrix(A)
  B = input("L�tfen B Matrisini tan�mlay�n�z: ");
  if ((size(A)(1)==size(B)(1))&&(size(B)(2)==1))

    G=[A,B];

    [N,M]=size(G);

    for i=1:M-1
      X(i)=0;
    endfor
    NumberOfIterations = 0;
    while true
      Control = X;
      for i=1:N
        Cache = 0;
        for j=1:M-1
          Cache += (-(A(i, j) * Control(j)));
        endfor
        X(i) = round((B(i,1) + Cache + (A(i, i) * Control(i)))/A(i,i)*10000)/10000;
      endfor
      NumberOfIterations++;
      if (Control == X) break; endif
    endwhile
    fprintf("�terasyon Say�s�: %d\n", NumberOfIterations);
    for s=1:N
      fprintf ("X%d: %d\n", s, X(s));
    endfor
 
  else
    errordlg("L�tfen giri� dizenizi matris format�nda tan�mlay�n�z.\nProgramdan ��k�l�yor.");
  endif
else
  errordlg("L�tfen giri� dizenizi matris format�nda tan�mlay�n�z.\nProgramdan ��k�l�yor.");
endif
