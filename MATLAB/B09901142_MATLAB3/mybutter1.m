%1(a)
fs = 20;
Ts = 1/fs;
x = zeros(100);
for i=1:100
    x(i) = cos(2*pi*(i-1)*Ts);
end
n = 1:100;
figure;
plot(n,x);

%1(b)
[b1,a1] = butter(3,0.05,'low');
[H1,w1] = freqz(b1,a1);
%disp([b1,a1]);
figure;
subplot(3,3,1);
plot(w1,20*log(abs(H1)));
subplot(3,3,2);
plot(w1,180/pi*angle(H1));
y1 = filter(b1,a1,x);
subplot(3,3,3);
plot(n,y1);

%1(c)
[b2,a2] = butter(7,0.05,'low');
[H2,w2] = freqz(b2,a2);
%[b2_p,a2_p] = sprintf('%E',[b2,a2]);
%disp(b2_p);
%disp(a2)
subplot(3,3,4);
plot(w2,20*log(abs(H2)));
subplot(3,3,5);
plot(w2,180/pi*angle(H2));
y2 = filter(b2,a2,x);
subplot(3,3,6);
plot(n,y2);

%1(d)
[b3,a3] = butter(3,0.5,'low');
[H3,w3] = freqz(b3,a3);
%b3_p = sprintf('%E',b3);
%a3_p = sprintf('%E',a3);
%disp(b3);
%disp(a3_p);
subplot(3,3,7);
plot(w3,20*log(abs(H3)));
subplot(3,3,8);
plot(w3,180/pi*angle(H3));
y3 = filter(b3,a3,x);
subplot(3,3,9);
plot(n,y3);





