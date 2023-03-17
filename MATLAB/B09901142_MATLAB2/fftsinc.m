% 1(a) 
N = 1001;
T = 100;
N1 = 500;
n = -N1:1:N1;
Ts = T/N1;
x = sinc(2.*n*Ts);
figure;
plot(n,x);

% 1(b)
y = fft(x,N);
Xf = fftshift(abs(y));
Fs = 1/Ts;
omega = Fs*(-N1:N1)/N;
figure;
plot(omega,Xf);

% 1(c)

Xk = 0;
k = -N1:N1;
omega_k = 2*pi*(k-1)/N;
for q=1:N
    index = -N1+q-1;
    Xk=Xk+x(q)*exp((-1i)*2*pi*(index)*(k-1)/N);
end

figure;
plot(omega_k,abs(Xk));

% 1(d)
Tw = T/2;
w = 1:N;
for i = 1:N
    j = -N1+(i-1);
    if(abs(j*Ts)<=Tw/2)
        w(i) = 1/2*(1+cos(2*pi*abs(j*Ts)/Tw));
    else
        w(i) = 0;
    end
end
figure
plot(n,w);

% 1(e)
x_hann = x .* w;
figure;
plot(n,x_hann);

% 1(f)
y_hann = fft(x_hann,N);
Xf_hann = fftshift(abs(y_hann));
figure;
plot(omega,Xf_hann);

