x1 = zeros(50,1);
for i=1:20
    x1(i)=i;
end
for i=21:39
    x1(i)= 40-i;
end
figure;
stem(x1);

x2 = zeros(50,1);
for i=1:10
    x2(i)= 1;
end
figure;
stem(x2);

y = conv(x1,x2);
figure;
stem(y);



M1= zeros(99,50);
for i=1:50
    for j=1:50
        M1(i+j-1,i)= x1(j);
    end
end
M2= reshape(x2,50,1);
y2=M1*M2;

figure;
stem(y2);

%%
x3 = zeros(10,1);
for i=1:3
    x3(i)=3^i;
end

figure;
stem(x3);

x4 = zeros(10,1);
for i=1:5
    x4(i)= 2^i;
end
figure;
stem(x4);

yd1 = conv(x3,x4);
figure;
stem(yd1);



M3= zeros(19,10);
for i=1:10
    for j=1:10
        M3(i+j-1,i)= x3(j);
    end
end
M4= reshape(x4,10,1);
yd2=M3*M4;

figure;
stem(yd2);











