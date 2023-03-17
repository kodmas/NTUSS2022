%2(a)
Ts = 0.002;
f1 = 100;
M = 1000;
x = zeros(M);
for i = 1:M
    x(i) = cos(2*pi*(i-1)*Ts)+2*cos(2*pi*f1*(i-1)*Ts);
end
n = 1:M;
subplot(3,1,1);
plot(n,x);

%2(b)
fc1 = 0.1;
[b1,a1] = butter(16,fc1,'low');
[H1,w1] = freqz(b1,a1);
y1 = filter(b1,a1,x);
%b1_p = sprintf('%E',b1);
%disp(b1_p);
%disp(a1);
subplot(3,1,2);
plot(n,y1);

%2(c)
fb1 = 0.25;
fb2 = 0.5;
[b2,a2] = butter(16,[fb1,fb2],'bandpass');
[H2,w2] = freqz(b2,a2);
y2 = filter(b2,a2,x);
%b2_p = sprintf('%E',b2);
%a2_p = sprintf('%E',a2);
%disp(b2);
%disp(a2);
%disp(b2_p);
%disp(a2_p);
subplot(3,1,3);
plot(n,y2);