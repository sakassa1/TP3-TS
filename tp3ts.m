 clear all
 close all
 clc
load('Ring.mat');

Fs=44100;
Ts =1/Fs;
t =0:Ts:(length(y)-1)*Ts ;
 plot(t,y);
  %sound(y,Fs);

 xline(7,'--r');
 xline(8,'--r');
 fragment=y(7*Fs:8*Fs);
 %sound(fragment,Fs);
 figure(2)
  plot(fragment)
  corr=xcorr(y,fragment);
  figure(3)
  plot(corr);%Le plus grand pic se produit à la valeur de décalage lorsque les éléments de x et y correspondent exactement
  figure(4);
[m,d]=max(corr);      %find value and index of maximum value of cross-correlation amplitude
delay=d-max(length(y),length(fragment));   %shift index d, as length(X1)=2*N-1; where N is the length of the signals
plot(y)                                     %Plot signal s1
hold on,plot([delay+1:length(fragment)+delay],fragment,'r');  
%-------------------------------------

ynoise = awgn(y,30)+y;
fnoise=awgn(fragment,30)+fragment;
figure(5);
plot(t,[y ynoise]);
xline(7,'--r');
 xline(8,'--r');
figure(6);
plot(fnoise);
%sound(ynoise);
corr1=xcorr(ynoise,fnoise);
  figure(7)
  plot(corr1);%Le plus grand pic se produit à la valeur de décalage lorsque les éléments de x et y correspondent exactement
  figure(8);
[m,d]=max(corr1);      %find value and index of maximum value of cross-correlation amplitude
delay=d-max(length(ynoise),length(fnoise));   %shift index d, as length(X1)=2*N-1; where N is the length of the signals
plot(ynoise);
hold on,plot([delay+1:length(fnoise)+delay],fnoise,'r');