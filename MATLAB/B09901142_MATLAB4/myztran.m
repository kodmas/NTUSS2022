%(a)
b=0.09.*conv(conv([1,-1],[1,1]),conv([1,-1],[1,1]));
a=conv(conv([1,-0.3-0.4i],[1,-0.3+0.4i]),conv([1,-0.1-0.1i],[1,-0.1+0.1i]));
figure
subplot(2,4,1);
zplane(b,a);
title('ROC')

%(b)
[r,p,k]=residuez(b, a);
%disp(k)  len(k) = 1 plus it to n^0
n=0:1:20;
h=r(1)*p(1).^(n)+r(2)*p(2).^(n)+r(3)*p(3).^(n)+r(4)*p(4).^(n);
h(1)=h(1)+k;
subplot(2,4,2);
stem(n,h);
title('h[n]');

%(c)
[H, w]=freqz(b,a);
subplot(2,4,3);
plot(w,20*log(abs(H)));
title('magnitude response (dB)');

subplot(2,4,4);
plot(w,angle(H)/pi*180);
title('phase response (deg)');

%(d)
z=[1,1,-1,-1];
p=[0.3+0.4i,0.3-0.4i,0.1+0.1i,0.1-0.1i];
k=0.09;
sos=zp2sos(z,p,k);
disp(sos)

%(e)
[H1,w1]=freqz([0.09,0.18,0.09],[1,-0.2,0.02]);
[H2,w2]=freqz([1,-2,1],[1,-0.6,0.25]);
subplot(2,4,5);
plot(w1, 20*log(abs(H1)));
title('magnitude H1(z) (dB)');

subplot(2,4,6);
plot(w2, 20*log(abs(H2)));
title('magnitude H2(z) (dB)');

subplot(2,4,7);
plot(w,20*log(abs(H1).* abs(H2)));
title('magnitude H1(z)*H2(z) (dB)');

%(f)
delta=zeros(1,21);
delta(1)=1;
y=filter(b,a,delta);
subplot(2,4,8);
stem(n,y);
title('y[n]');

